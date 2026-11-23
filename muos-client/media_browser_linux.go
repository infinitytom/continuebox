package main

import (
	"bufio"
	"bytes"
	"errors"
	"fmt"
	"image"
	_ "image/jpeg"
	_ "image/png"
	"io"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	"strings"
	"time"
	"unicode/utf8"
)

type coverResult struct {
	address string
	picture *image.RGBA
}

var coverHTTP = &http.Client{Timeout: 5 * time.Second, CheckRedirect: network.CheckRedirect}

func fetchCover(address string) *image.RGBA {
	res, err := coverHTTP.Get(address)
	if err != nil {
		return nil
	}
	defer res.Body.Close()
	if res.StatusCode != http.StatusOK {
		return nil
	}
	data, err := io.ReadAll(io.LimitReader(res.Body, 512<<10))
	if err != nil {
		return nil
	}
	cfg, _, err := image.DecodeConfig(bytes.NewReader(data))
	if err != nil || cfg.Width < 1 || cfg.Height < 1 || cfg.Width > 1600 || cfg.Height > 1600 {
		return nil
	}
	decoded, _, err := image.Decode(bytes.NewReader(data))
	if err != nil {
		return nil
	}
	const width, height = 40, 52
	bounds := decoded.Bounds()
	output := image.NewRGBA(image.Rect(0, 0, width, height))
	scale := min(float64(width)/float64(bounds.Dx()), float64(height)/float64(bounds.Dy()))
	w, h := max(1, int(float64(bounds.Dx())*scale)), max(1, int(float64(bounds.Dy())*scale))
	for y := 0; y < h; y++ {
		for x := 0; x < w; x++ {
			output.Set((width-w)/2+x, (height-h)/2+y, decoded.At(bounds.Min.X+x*bounds.Dx()/w, bounds.Min.Y+y*bounds.Dy()/h))
		}
	}
	return output
}

func (b *browser) collectCovers() bool {
	changed := false
	for {
		select {
		case result := <-b.coverQueue:
			b.covers[result.address] = result.picture
			b.coverLoading--
			changed = true
		default:
			return changed
		}
	}
}

func (b *browser) searchKeyboard(title string, submit func(string) error) {
	b.keyboard = &keyboard{title: title, search: true, submit: func(raw string) error {
		query := strings.TrimSpace(raw)
		if query == "" {
			return errors.New("请输入关键词")
		}
		return submit(query)
	}}
	f, err := os.Open(filepath.Join(filepath.Dir(b.config), "continuebox-search.txt"))
	if err != nil {
		return
	}
	defer f.Close()
	scan := bufio.NewScanner(io.LimitReader(f, 4096))
	if scan.Scan() && utf8.ValidString(scan.Text()) {
		query := []rune(strings.TrimSpace(strings.TrimPrefix(scan.Text(), "\ufeff")))
		if len(query) <= 120 {
			b.keyboard.value = query
		}
	}
}

func (b *browser) openSearch(sources []site, query string) error {
	const maxSources = 8
	type result struct {
		items []media
		err   error
	}
	var selected []site
	var pending []chan result
	for _, source := range sources {
		if source.Searchable == "0" {
			continue
		}
		ch := make(chan result, 1)
		selected = append(selected, source)
		pending = append(pending, ch)
		go func() {
			catalog, _, err := source.catalog(url.Values{"wd": {query}, "pg": {"1"}})
			ch <- result{catalog.Items, err}
		}()
		if len(selected) == maxSources {
			break
		}
	}
	if len(selected) == 0 {
		return errors.New("当前订阅没有可搜索的站点")
	}
	v := &view{title: "多站搜索  " + query, thumbnails: true}
	failures := 0
	for i, ch := range pending {
		reply := <-ch
		if reply.err != nil {
			failures++
			continue
		}
		source := selected[i]
		seen := map[field]bool{}
		for _, item := range reply.items {
			if item.ID == "" || seen[item.ID] {
				continue
			}
			seen[item.ID] = true
			v.rows = append(v.rows, row{label: item.Name, note: strings.TrimSpace(source.Name + "  " + item.Note), cover: item.Picture,
				open: func() error { return b.openMovie(source, item) }})
		}
	}
	v.message = fmt.Sprintf("%d 个站点 · %d 条结果", len(selected), len(v.rows))
	if failures > 0 {
		v.message += fmt.Sprintf(" · %d 站连接失败", failures)
	}
	b.push(v)
	return nil
}
