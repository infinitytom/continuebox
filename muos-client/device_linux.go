package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"net/url"
	"os"
	"os/exec"
	"strconv"
	"syscall"
	"time"
)

const (
	pageSize    = 24
	visibleRows = 7
	wasabi      = "/opt/muos/frontend/muxmedia"
	stateFile   = "/run/muos/wasabi/now.json"
	controlFile = "/run/muos/wasabi/control"
)

var sections = []struct{ key, title string }{
	{"resume", "继续观看"}, {"latest", "最新入库"}, {"movies", "电影"}, {"series", "剧集"},
}

type browserState struct {
	catalog
	tab, page, selected int
	showEpisodes        bool
	parentCatalog       catalog
	parentSelection     int
	message             string
}

func (b *browserState) load(c *client) {
	b.selected = 0
	b.catalog = catalog{}
	request := fmt.Sprintf("/api/v1/emby/catalog?section=%s&start=%d&limit=%d",
		sections[b.tab].key, b.page*pageSize, pageSize)
	if err := c.call("GET", request, nil, &b.catalog); err != nil {
		b.message = err.Error()
	} else {
		b.message = ""
	}
}

func (b *browserState) draw(s *screen) {
	fg := color{228, 240, 241, 255}
	muted := color{151, 173, 185, 255}
	accent := color{98, 231, 189, 255}
	s.box(color{16, 26, 35, 255}, 0, 0, 720, 480)
	s.text(s.heading, fg, 24, 12, 540, "续映 ContinueBox")
	s.text(s.font, accent, 576, 25, 120, "muOS 预览版")
	for i, section := range sections {
		x := int32(24 + i*171)
		tint := muted
		if i == b.tab {
			s.box(color{31, 71, 69, 255}, x, 65, 153, 36)
			tint = accent
		}
		s.text(s.font, tint, x+10, 66, 143, section.title)
	}
	start := max(0, b.selected-visibleRows+1)
	for index := start; index < min(len(b.Items), start+visibleRows); index++ {
		item := b.Items[index]
		y := int32(108 + (index-start)*43)
		if index == b.selected {
			s.box(color{35, 60, 74, 255}, 24, y, 672, 42)
			s.box(accent, 24, y, 4, 42)
		}
		label := item.label()
		note := item.Note
		if b.showEpisodes {
			label, note = item.Subtitle, ""
		}
		s.text(s.font, fg, 38, y+4, 520, label)
		s.text(s.font, muted, 563, y+4, 125, note)
	}
	message := b.message
	if message == "" && len(b.Items) == 0 {
		message = "这个列表暂无内容 · 左右切换栏目"
	} else if message == "" && b.showEpisodes {
		message = fmt.Sprintf("选集  %d / %d", b.selected+1, len(b.Items))
	} else if message == "" {
		message = fmt.Sprintf("第 %d 页 · L/R 翻页", b.page+1)
	}
	s.text(s.font, accent, 24, 414, 672, message)
	s.text(s.font, muted, 24, 447, 672, "方向键 浏览     A 确定     B 返回")
	s.present(s.renderer)
}

func runDevice() error {
	if len(os.Args) != 2 {
		return errors.New("需要 TF 卡配置文件路径")
	}
	s, err := newScreen()
	if err != nil {
		return err
	}
	defer func() {
		if s != nil {
			s.close()
		}
	}()
	b := browserState{}
	raw, err := os.ReadFile(os.Args[1])
	var cfg settings
	if err != nil || json.Unmarshal(raw, &cfg) != nil || cfg.Token == "" {
		b.message = "请先运行 Windows 配置工具，将配置复制到 TF1 根目录"
		b.draw(s)
		for {
			switch s.action() {
			case "back", "quit":
				return nil
			}
		}
	}
	c, err := connect(cfg)
	if err != nil {
		return err
	}
	b.message = "正在读取片库…"
	b.draw(s)
	b.load(c)
	for {
		b.draw(s)
		for action := ""; ; {
			action = s.action()
			if action == "" {
				continue
			}
			switch action {
			case "quit":
				return nil
			case "back":
				if !b.showEpisodes {
					return nil
				}
				b.catalog, b.selected, b.showEpisodes = b.parentCatalog, b.parentSelection, false
				b.message = ""
			case "up":
				b.selected = max(0, b.selected-1)
			case "down":
				b.selected = max(0, min(len(b.Items)-1, b.selected+1))
			case "prev", "next", "page-prev", "page-next":
				if b.showEpisodes {
					break
				}
				switch action {
				case "prev":
					b.tab, b.page = (b.tab+len(sections)-1)%len(sections), 0
				case "next":
					b.tab, b.page = (b.tab+1)%len(sections), 0
				case "page-prev":
					b.page = max(0, b.page-1)
				case "page-next":
					if (b.page+1)*pageSize >= b.Total || sections[b.tab].key == "latest" {
						break
					}
					b.page++
				}
				b.message = "正在加载…"
				b.draw(s)
				b.load(c)
			case "select":
				if len(b.Items) == 0 {
					break
				}
				item := b.Items[b.selected]
				if item.Type == "Series" {
					rows, err := c.episodes(item)
					if err != nil {
						b.message = err.Error()
					} else if len(rows) == 0 {
						b.message = "未找到分集"
					} else {
						b.parentCatalog, b.parentSelection = b.catalog, b.selected
						b.catalog, b.selected = catalog{Items: rows, Total: len(rows)}, 0
						b.showEpisodes, b.message = true, ""
					}
					break
				}
				b.message = "正在获取播放地址…"
				b.draw(s)
				stream, err := c.stream(item)
				if err != nil {
					b.message = err.Error()
					break
				}
				s.close()
				s = nil
				b.message = c.play(item, stream)
				s, err = newScreen()
				if err != nil {
					s = nil
					return err
				}
			}
			break
		}
	}
}

type playbackState struct {
	URI      string  `json:"uri"`
	Position float64 `json:"position"`
	Duration float64 `json:"duration"`
	Seek     int     `json:"seek"`
	Updated  int64   `json:"updated"`
}

func (c *client) stream(item media) (string, error) {
	var source struct {
		URL string `json:"url"`
	}
	err := c.call("GET", "/api/v1/emby/play/"+url.PathEscape(item.ID), nil, &source)
	if err != nil {
		return "", err
	}
	u, err := url.Parse(source.URL)
	base, _ := url.Parse(c.Server)
	if err != nil || u.Host == "" || u.User != nil || u.Scheme != base.Scheme || u.Host != base.Host {
		return "", errors.New("服务器返回的播放地址与已配置的服务地址不一致")
	}
	return source.URL, nil
}

func (c *client) report(item media, state playbackState, event string) error {
	mediaType := "movie"
	var season, episode int
	if item.Type == "Episode" {
		mediaType = "episode"
		_, _ = fmt.Sscanf(item.Note, "S%dE%d", &season, &episode)
	}
	body := map[string]any{
		"event": event, "title": item.Name, "media_type": mediaType, "emby_item_id": item.ID,
		"season": season, "episode": episode, "position_ms": int64(state.Position * 1000),
		"duration_ms": int64(state.Duration * 1000),
	}
	var result struct {
		Integrations struct {
			Emby struct {
				Reported bool `json:"reported"`
			} `json:"emby"`
		} `json:"integrations"`
	}
	if err := c.call("POST", "/api/v1/playback/event", body, &result); err != nil {
		return err
	}
	if !result.Integrations.Emby.Reported {
		return errors.New("Emby 未确认收到进度")
	}
	return nil
}

func (c *client) resume(item media) int64 {
	var status struct {
		Available bool  `json:"available"`
		Position  int64 `json:"position_ms"`
		Played    bool  `json:"played"`
	}
	mediaType := "movie"
	if item.Type == "Episode" {
		mediaType = "episode"
	}
	if c.call("POST", "/api/v1/emby/resume", map[string]any{
		"title": item.Name, "media_type": mediaType, "emby_item_id": item.ID,
	}, &status) == nil && status.Available {
		if status.Played {
			return 0
		}
		return status.Position
	}
	return item.Position
}

func seek(seconds float64) bool {
	info, err := os.Lstat(controlFile)
	if err != nil || info.Mode()&os.ModeNamedPipe == 0 {
		return false
	}
	pipe, err := os.OpenFile(controlFile, os.O_WRONLY|syscall.O_NONBLOCK|syscall.O_NOFOLLOW, 0)
	if err != nil {
		return false
	}
	defer pipe.Close()
	_, err = fmt.Fprintln(pipe, "seek "+strconv.FormatFloat(seconds, 'f', 3, 64))
	return err == nil
}

func (c *client) play(item media, stream string) string {
	resumeAt := float64(c.resume(item)) / 1000
	player := exec.Command(wasabi, "--title", item.label(), stream)
	start := time.Now()
	if err := player.Start(); err != nil {
		return "无法启动 Wasabi"
	}
	finished := make(chan error, 1)
	go func() { finished <- player.Wait() }()
	poll := time.NewTicker(500 * time.Millisecond)
	defer poll.Stop()
	var last playbackState
	var reported time.Time
	seekRequested := false
	for {
		select {
		case err := <-finished:
			if last.Duration == 0 {
				if err != nil {
					return "Wasabi 播放失败"
				}
				return "没有可同步的进度，或 Wasabi 未报告播放状态"
			}
			if c.report(item, last, "stop") != nil {
				return "已退出播放，Emby 进度同步失败"
			}
			return "已同步播放进度"
		case <-poll.C:
			data, err := os.ReadFile(stateFile)
			var state playbackState
			if err != nil || json.Unmarshal(data, &state) != nil || state.URI != stream ||
				state.Updated < start.Unix() || state.Duration < 1 || state.Position < 0 {
				continue
			}
			if resumeAt > 3 && resumeAt < state.Duration-2 && last.Duration == 0 {
				if state.Position < resumeAt-3 {
					if !seekRequested && state.Seek != 0 {
						seekRequested = seek(resumeAt)
					}
					continue
				}
			}
			last = state
			if time.Since(reported) >= 30*time.Second {
				event := "progress"
				if reported.IsZero() {
					event = "start"
				}
				reported = time.Now()
				_ = c.report(item, state, event)
			}
		}
	}
}
