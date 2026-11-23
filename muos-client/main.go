package main

import (
	"bufio"
	"bytes"
	"encoding/base64"
	"encoding/json"
	"encoding/xml"
	"errors"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"path"
	"regexp"
	"strings"
	"time"

	"github.com/tailscale/hujson"
)

type field string

func (f *field) UnmarshalJSON(data []byte) error {
	if bytes.Equal(data, []byte("null")) {
		*f = ""
		return nil
	}
	if len(data) > 0 && data[0] == '"' {
		var value string
		if err := json.Unmarshal(data, &value); err != nil {
			return err
		}
		*f = field(value)
		return nil
	}
	var number json.Number
	if err := json.Unmarshal(data, &number); err != nil {
		return err
	}
	*f = field(number)
	return nil
}

type site struct {
	Name       string          `json:"name"`
	Kind       field           `json:"type"`
	API        string          `json:"api"`
	Ext        json.RawMessage `json:"ext"`
	Searchable field           `json:"searchable"`
}

type subscriptionLink struct {
	Name string `json:"name"`
	URL  string `json:"url"`
}

type subscription struct {
	Sites   []site             `json:"sites"`
	Links   []subscriptionLink `json:"urls"`
	Skipped int                `json:"-"`
}

type category struct {
	ID   field  `json:"type_id"`
	Name string `json:"type_name"`
}

type media struct {
	ID      field  `json:"vod_id"`
	Name    string `json:"vod_name"`
	Note    string `json:"vod_remarks"`
	From    string `json:"vod_play_from"`
	Links   string `json:"vod_play_url"`
	Picture string `json:"vod_pic"`
}

type catalog struct {
	Categories []category `json:"class"`
	Items      []media    `json:"list"`
	Pages      field      `json:"pagecount"`
}

type episode struct {
	Name, Flag, Link string
}

const maxResponse = 4 << 20

var network = &http.Client{
	Timeout: 10 * time.Second,
	CheckRedirect: func(req *http.Request, via []*http.Request) error {
		if len(via) >= 5 || !webURL(req.URL) ||
			(via[len(via)-1].URL.Scheme == "https" && req.URL.Scheme != "https") {
			return http.ErrUseLastResponse
		}
		return nil
	},
}

var configEnvelope = regexp.MustCompile(`[A-Za-z0-9]{8}\*\*`)

func webURL(u *url.URL) bool {
	return u != nil && (u.Scheme == "http" || u.Scheme == "https") &&
		u.Hostname() != "" && u.User == nil
}

func resolve(base *url.URL, raw string) (*url.URL, error) {
	raw = strings.TrimSpace(strings.TrimPrefix(strings.TrimSpace(raw), "\ufeff"))
	if raw == "" || len(raw) > 4096 || strings.ContainsAny(raw, "\r\n\x00") {
		return nil, errors.New("地址为空或格式无效")
	}
	u, err := url.Parse(raw)
	if err != nil {
		return nil, errors.New("地址格式无效")
	}
	if base != nil {
		u = base.ResolveReference(u)
	}
	if !webURL(u) {
		return nil, errors.New("请使用 HTTP 或 HTTPS 地址")
	}
	return u, nil
}

func get(u *url.URL) ([]byte, *url.URL, error) {
	req, err := http.NewRequest("GET", u.String(), nil)
	if err != nil {
		return nil, nil, errors.New("无法创建请求")
	}
	req.Header.Set("User-Agent", "ContinueBox-muOS/0.2")
	res, err := network.Do(req)
	if err != nil {
		return nil, nil, errors.New("请求失败，请检查网络、地址和证书")
	}
	defer res.Body.Close()
	if res.StatusCode != http.StatusOK {
		return nil, nil, fmt.Errorf("站点返回 HTTP %d", res.StatusCode)
	}
	raw, err := io.ReadAll(io.LimitReader(res.Body, maxResponse+1))
	if err != nil || len(raw) > maxResponse {
		return nil, nil, errors.New("读取响应失败，或配置超过 4 MiB")
	}
	return bytes.TrimSpace(bytes.TrimPrefix(raw, []byte{0xef, 0xbb, 0xbf})), res.Request.URL, nil
}

func loadSubscription(raw string) (subscription, error) {
	var cfg subscription
	u, err := resolve(nil, raw)
	if err != nil {
		return cfg, err
	}
	body, base, err := get(u)
	if err != nil {
		return cfg, err
	}
	standard, err := subscriptionJSON(body)
	if err != nil || json.Unmarshal(standard, &cfg) != nil {
		return cfg, errors.New("无法读取 TVBox JSON 配置")
	}
	sites := cfg.Sites[:0]
	for _, entry := range cfg.Sites {
		if entry.Kind != "0" && entry.Kind != "1" && entry.Kind != "4" {
			cfg.Skipped++
			continue
		}
		api, err := resolve(base, entry.API)
		if err != nil {
			cfg.Skipped++
			continue
		}
		entry.API = api.String()
		sites = append(sites, entry)
	}
	cfg.Sites = sites
	links := cfg.Links[:0]
	for _, entry := range cfg.Links {
		if link, err := resolve(base, entry.URL); err == nil {
			entry.URL = link.String()
			links = append(links, entry)
		}
	}
	cfg.Links = links
	if len(cfg.Sites)+len(cfg.Links) == 0 {
		if cfg.Skipped != 0 {
			return cfg, errors.New("此订阅没有可用接口，可能需要安卓 Spider 插件")
		}
		return cfg, errors.New("配置没有可用的站点或子订阅")
	}
	return cfg, nil
}

func subscriptionJSON(body []byte) ([]byte, error) {
	if bytes.HasPrefix(body, []byte("{")) {
		return hujson.Standardize(body)
	}
	marker := configEnvelope.FindIndex(body)
	if marker == nil {
		return hujson.Standardize(body)
	}
	payload := strings.Join(strings.Fields(string(body[marker[1]:])), "")
	decoded, err := base64.StdEncoding.DecodeString(payload)
	if err != nil {
		decoded, err = base64.RawStdEncoding.DecodeString(payload)
	}
	if err != nil {
		return nil, err
	}
	return hujson.Standardize(bytes.TrimPrefix(decoded, []byte{0xef, 0xbb, 0xbf}))
}

func (s site) request(params url.Values) ([]byte, *url.URL, error) {
	u, err := resolve(nil, s.API)
	if err != nil {
		return nil, nil, err
	}
	query := u.Query()
	for key, values := range params {
		query[key] = values
	}
	if s.Kind == "4" && len(s.Ext) != 0 && string(s.Ext) != "null" {
		var value string
		if json.Unmarshal(s.Ext, &value) != nil {
			value = string(s.Ext)
		}
		if value != "" {
			query.Set("extend", value)
		}
	}
	u.RawQuery = query.Encode()
	return get(u)
}

func (s site) catalog(params url.Values) (catalog, *url.URL, error) {
	var result catalog
	if params.Has("t") || params.Has("ids") || params.Has("wd") {
		action := "detail"
		if s.Kind == "0" {
			action = "videolist"
		}
		params.Set("ac", action)
	}
	if s.Kind == "4" {
		switch {
		case params.Has("wd"):
			params.Set("quick", "false")
		case !params.Has("ids"):
			params.Set("filter", "true")
			if params.Has("t") {
				params.Set("ext", "e30=")
			}
		}
	}
	body, base, err := s.request(params)
	if err != nil {
		return result, base, err
	}
	if s.Kind == "0" && bytes.HasPrefix(body, []byte("<")) {
		result, err = readXML(body)
	} else {
		err = json.Unmarshal(body, &result)
	}
	if err != nil || (result.Items == nil && result.Categories == nil && result.Pages == "") {
		return catalog{}, nil, errors.New("站点没有返回可识别的影视列表")
	}
	for i := range result.Items {
		item := &result.Items[i]
		if cover, err := resolve(base, item.Picture); err == nil {
			item.Picture = cover.String()
		} else {
			item.Picture = ""
		}
	}
	return result, base, nil
}

func readXML(body []byte) (catalog, error) {
	var rss struct {
		XMLName    xml.Name `xml:"rss"`
		Categories []struct {
			ID   string `xml:"id,attr"`
			Name string `xml:",chardata"`
		} `xml:"class>ty"`
		List struct {
			Pages  string `xml:"pagecount,attr"`
			Videos []struct {
				ID      string `xml:"id"`
				Name    string `xml:"name"`
				Note    string `xml:"note"`
				Picture string `xml:"pic"`
				Lines   []struct {
					Flag  string `xml:"flag,attr"`
					Links string `xml:",chardata"`
				} `xml:"dl>dd"`
			} `xml:"video"`
		} `xml:"list"`
	}
	if err := xml.Unmarshal(body, &rss); err != nil {
		return catalog{}, err
	}
	result := catalog{Pages: field(rss.List.Pages), Items: []media{}, Categories: []category{}}
	for _, entry := range rss.Categories {
		result.Categories = append(result.Categories, category{field(entry.ID), entry.Name})
	}
	for _, entry := range rss.List.Videos {
		var flags, links []string
		for _, line := range entry.Lines {
			flags = append(flags, line.Flag)
			links = append(links, line.Links)
		}
		result.Items = append(result.Items, media{
			ID: field(entry.ID), Name: entry.Name, Note: entry.Note, Picture: entry.Picture,
			From: strings.Join(flags, "$$$"), Links: strings.Join(links, "$$$"),
		})
	}
	return result, nil
}

func episodes(item media) []episode {
	flags := strings.Split(item.From, "$$$")
	var result []episode
	for line, group := range strings.Split(item.Links, "$$$") {
		flag := ""
		if line < len(flags) {
			flag = flags[line]
		}
		for _, raw := range strings.Split(group, "#") {
			name, link, hasLabel := strings.Cut(strings.TrimSpace(raw), "$")
			if !hasLabel {
				name, link = "正片", name
			}
			if link != "" {
				result = append(result, episode{name, flag, link})
			}
		}
	}
	return result
}

type playbackStream struct {
	url       string
	extension string
	headers   http.Header
}

func (s site) resolvePlayback(base *url.URL, ep episode) (playbackStream, error) {
	link := ep.Link
	var headers http.Header
	if s.Kind == "4" {
		var reply struct {
			URL    string          `json:"url"`
			Parse  field           `json:"parse"`
			JX     field           `json:"jx"`
			Header json.RawMessage `json:"header"`
		}
		raw, effective, err := s.request(url.Values{"play": {ep.Link}, "flag": {ep.Flag}})
		if err != nil {
			return playbackStream{}, err
		}
		if json.Unmarshal(raw, &reply) != nil {
			return playbackStream{}, errors.New("远程站点未返回有效播放地址")
		}
		if reply.Parse != "" && reply.Parse != "0" || reply.JX != "" && reply.JX != "0" {
			return playbackStream{}, errors.New("这条线路需要网页解析，请换一条直连线路")
		}
		headers, err = playbackHeaders(reply.Header)
		if err != nil {
			return playbackStream{}, err
		}
		link, base = reply.URL, effective
	}
	stream, err := resolve(base, link)
	if err != nil {
		return playbackStream{}, errors.New("该线路没有 HTTP 视频地址")
	}
	extension := strings.ToLower(path.Ext(stream.Path))
	switch extension {
	case ".mp4", ".m3u8", ".mkv", ".webm", ".ts", ".mov", ".flv", ".m4v", ".avi", ".m3u":
		return playbackStream{stream.String(), extension, headers}, nil
	}
	req, err := http.NewRequest("GET", stream.String(), nil)
	if err != nil {
		return playbackStream{}, errors.New("播放地址无效")
	}
	if headers != nil {
		req.Header = headers.Clone()
	}
	req.Header.Set("Range", "bytes=0-511")
	res, err := network.Do(req)
	if err != nil {
		return playbackStream{}, errors.New("无法连接视频地址")
	}
	defer res.Body.Close()
	if res.StatusCode != http.StatusOK && res.StatusCode != http.StatusPartialContent {
		return playbackStream{}, fmt.Errorf("视频地址返回 HTTP %d", res.StatusCode)
	}
	mime := strings.ToLower(res.Header.Get("Content-Type"))
	sample, _ := io.ReadAll(io.LimitReader(res.Body, 512))
	switch {
	case strings.Contains(mime, "mpegurl"), bytes.HasPrefix(bytes.TrimSpace(sample), []byte("#EXTM3U")):
		extension = ".m3u8"
	case strings.HasPrefix(mime, "video/mp4"), len(sample) >= 8 && string(sample[4:8]) == "ftyp":
		extension = ".mp4"
	case strings.HasPrefix(mime, "video/"):
		extension = ""
	default:
		return playbackStream{}, errors.New("这条线路没有返回可直接播放的视频")
	}
	return playbackStream{res.Request.URL.String(), extension, headers}, nil
}

func setup() error {
	fmt.Print("TVBox subscription URL: ")
	value, err := bufio.NewReader(os.Stdin).ReadString('\n')
	if err != nil && len(value) == 0 {
		return err
	}
	cfg, err := loadSubscription(value)
	if err != nil {
		return err
	}
	if err := os.WriteFile("continuebox-tvbox.txt", []byte(strings.TrimSpace(value)+"\n"), 0600); err != nil {
		return err
	}
	fmt.Printf("可用接口 %d 个，子订阅 %d 个。复制 continuebox-tvbox.txt 到 TF1 根目录。\n", len(cfg.Sites), len(cfg.Links))
	return nil
}

func main() {
	var err error
	if len(os.Args) == 2 && os.Args[1] == "setup" {
		err = setup()
	} else {
		err = runDevice()
	}
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
}
