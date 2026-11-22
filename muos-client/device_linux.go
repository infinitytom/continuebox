package main

import (
	"errors"
	"fmt"
	"net/url"
	"os"
	"os/exec"
	"strconv"
	"strings"
)

const (
	visibleRows = 7
	wasabi      = "/opt/muos/frontend/muxmedia"
)

var (
	fg         = color{228, 240, 241, 255}
	muted      = color{151, 173, 185, 255}
	accent     = color{98, 231, 189, 255}
	background = color{16, 26, 35, 255}
)

type row struct {
	label, note string
	open        func() error
}

type view struct {
	title                 string
	rows                  []row
	selected, page, pages int
	reload                func(int) error
	message               string
}

type browser struct {
	screen   *screen
	config   string
	stack    []*view
	keyboard *keyboard
}

func (b *browser) current() *view  { return b.stack[len(b.stack)-1] }
func (b *browser) push(next *view) { b.stack = append(b.stack, next) }

func (b *browser) home() *view {
	return &view{title: "TVBox 订阅", rows: []row{
		{label: "输入或修改订阅地址", open: func() error {
			raw, _ := os.ReadFile(b.config)
			b.keyboard = &keyboard{title: "输入 TVBox 订阅地址", value: []rune(strings.TrimSpace(string(raw))), submit: func(value string) error {
				cfg, err := loadSubscription(value)
				if err != nil {
					return err
				}
				tmp := b.config + ".tmp"
				if err := os.WriteFile(tmp, []byte(strings.TrimSpace(value)+"\n"), 0600); err != nil {
					return errors.New("无法保存订阅地址，请检查 TF1")
				}
				if err := os.Rename(tmp, b.config); err != nil {
					_ = os.Remove(tmp)
					return errors.New("无法更新订阅地址")
				}
				b.showSubscription(cfg)
				return nil
			}}
			return nil
		}},
		{label: "打开已保存的订阅", open: func() error {
			raw, err := os.ReadFile(b.config)
			if err != nil {
				return errors.New("请先输入 TVBox 订阅地址")
			}
			return b.openSubscription(strings.TrimSpace(string(raw)))
		}},
	}}
}

func (b *browser) openSubscription(value string) error {
	cfg, err := loadSubscription(value)
	if err != nil {
		return err
	}
	b.showSubscription(cfg)
	return nil
}

func (b *browser) showSubscription(cfg subscription) {
	v := &view{title: "订阅站点"}
	if cfg.Skipped > 0 {
		v.message = fmt.Sprintf("已略过 %d 个插件站或不兼容接口", cfg.Skipped)
	}
	for _, entry := range cfg.Links {
		v.rows = append(v.rows, row{entry.Name, "子订阅", func() error {
			return b.openSubscription(entry.URL)
		}})
	}
	for _, source := range cfg.Sites {
		v.rows = append(v.rows, row{source.Name, "站点", func() error { return b.openSite(source) }})
	}
	b.push(v)
}

func (b *browser) openSite(source site) error {
	result, _, err := source.catalog(url.Values{})
	if err != nil {
		return err
	}
	v := &view{title: source.Name}
	v.rows = append(v.rows, row{label: "搜索", open: func() error {
		b.keyboard = &keyboard{title: "搜索当前站点", submit: func(value string) error {
			if strings.TrimSpace(value) == "" {
				return errors.New("请输入关键词")
			}
			return b.openList(source, "搜索结果", url.Values{"wd": {strings.TrimSpace(value)}})
		}}
		return nil
	}})
	for _, entry := range result.Categories {
		if entry.ID != "" {
			v.rows = append(v.rows, row{entry.Name, "分类", func() error {
				return b.openList(source, entry.Name, url.Values{"t": {string(entry.ID)}})
			}})
		}
	}
	v.rows = append(v.rows, b.movieRows(source, result.Items)...)
	b.push(v)
	return nil
}

func (b *browser) openList(source site, title string, params url.Values) error {
	v := &view{title: title}
	v.reload = func(page int) error {
		params.Set("pg", strconv.Itoa(page))
		result, _, err := source.catalog(params)
		if err != nil {
			return err
		}
		v.page, v.selected = page, 0
		v.pages, _ = strconv.Atoi(string(result.Pages))
		v.rows = b.movieRows(source, result.Items)
		return nil
	}
	if err := v.reload(1); err != nil {
		return err
	}
	b.push(v)
	return nil
}

func (b *browser) movieRows(source site, items []media) []row {
	rows := make([]row, 0, len(items))
	for _, item := range items {
		if item.ID == "" {
			continue
		}
		rows = append(rows, row{item.Name, item.Note, func() error {
			return b.openMovie(source, item)
		}})
	}
	return rows
}

func (b *browser) openMovie(source site, item media) error {
	result, base, err := source.catalog(url.Values{"ids": {string(item.ID)}})
	if err != nil {
		return err
	}
	var detail media
	for _, candidate := range result.Items {
		if candidate.ID == item.ID {
			detail = candidate
			break
		}
	}
	if detail.ID == "" && len(result.Items) == 1 && result.Items[0].ID == "" {
		detail = result.Items[0]
	}
	parts := episodes(detail)
	if len(parts) == 0 {
		return errors.New("没有可用分集")
	}
	v := &view{title: item.Name}
	for _, ep := range parts {
		v.rows = append(v.rows, row{ep.Name, ep.Flag, func() error {
			address, err := source.playback(base, ep)
			if err != nil {
				return err
			}
			b.screen.close()
			b.screen = nil
			playerErr := exec.Command(wasabi, "--title", item.Name+" · "+ep.Name, address).Run()
			b.screen, err = newScreen()
			if err != nil {
				b.screen = nil
				return err
			}
			if playerErr != nil {
				return errors.New("Wasabi 无法播放这条线路")
			}
			return nil
		}})
	}
	b.push(v)
	return nil
}

func (b *browser) draw() {
	s := b.screen
	v := b.current()
	s.box(background, 0, 0, 720, 480)
	s.text(s.heading, fg, 24, 12, 490, "续映 ContinueBox")
	s.text(s.font, accent, 533, 23, 165, "TVBox 在线版")
	s.text(s.font, muted, 24, 65, 672, v.title)
	start := max(0, v.selected-visibleRows+1)
	for i := start; i < min(len(v.rows), start+visibleRows); i++ {
		r := v.rows[i]
		y := int32(100 + (i-start)*43)
		if i == v.selected {
			s.box(color{35, 60, 74, 255}, 24, y, 672, 42)
			s.box(accent, 24, y, 4, 42)
		}
		s.text(s.font, fg, 38, y+4, 490, r.label)
		s.text(s.font, muted, 536, y+4, 150, r.note)
	}
	message := v.message
	if message == "" {
		switch {
		case len(v.rows) == 0:
			message = "暂无内容"
		case v.pages > 0:
			message = fmt.Sprintf("第 %d / %d 页    L/R 翻页", v.page, v.pages)
		default:
			message = fmt.Sprintf("%d / %d", v.selected+1, len(v.rows))
		}
	}
	s.text(s.font, accent, 24, 414, 672, message)
	s.text(s.font, muted, 24, 447, 672, "方向键 浏览     A 确定     B 返回")
	s.present(s.renderer)
}

type keyboard struct {
	title   string
	value   []rune
	index   int
	shift   bool
	message string
	submit  func(string) error
}

const keys = "abcdefghijklmnopqrstuvwxyz0123456789:/.-_?&=%#+~@![](),;$'|"
const keyboardColumns = 10

func (k *keyboard) draw(s *screen) {
	s.box(background, 0, 0, 720, 480)
	s.text(s.heading, fg, 24, 12, 672, k.title)
	s.box(color{35, 60, 74, 255}, 23, 64, 674, 46)
	visible := k.value[max(0, len(k.value)-43):]
	s.text(s.font, fg, 36, 70, 644, string(visible)+"_")
	for i, key := range keys {
		x, y := int32(24+(i%keyboardColumns)*67), int32(126+(i/keyboardColumns)*41)
		fill, ink := color{29, 44, 55, 255}, fg
		if i == k.index {
			fill, ink = accent, background
		}
		s.box(fill, x, y, 63, 37)
		label := string(key)
		if k.shift {
			label = strings.ToUpper(label)
		}
		s.text(s.font, ink, x+21, y+2, 29, label)
	}
	s.text(s.font, accent, 24, 408, 672, k.message)
	s.text(s.font, muted, 24, 448, 672, "A 输入   X 空格   L 删除   R 大小写   START 提交   B 取消")
	s.present(s.renderer)
}

func (b *browser) edit(action string) {
	k := b.keyboard
	switch action {
	case "up":
		k.index = max(0, k.index-keyboardColumns)
	case "down":
		k.index = min(len(keys)-1, k.index+keyboardColumns)
	case "prev":
		k.index = (k.index + len(keys) - 1) % len(keys)
	case "next":
		k.index = (k.index + 1) % len(keys)
	case "page-prev":
		if len(k.value) > 0 {
			k.value = k.value[:len(k.value)-1]
		}
	case "page-next":
		k.shift = !k.shift
	case "select":
		if len(k.value) < 4096 {
			value := string(keys[k.index])
			if k.shift {
				value = strings.ToUpper(value)
			}
			k.value = append(k.value, []rune(value)...)
		}
	case "space":
		if len(k.value) < 4096 {
			k.value = append(k.value, ' ')
		}
	case "back":
		b.keyboard = nil
	case "submit":
		k.message = "正在连接…"
		k.draw(b.screen)
		if err := k.submit(string(k.value)); err != nil {
			k.message = err.Error()
		} else {
			b.keyboard = nil
		}
	}
}

func runDevice() error {
	if len(os.Args) != 2 {
		return errors.New("需要 TF 卡订阅文件路径")
	}
	screen, err := newScreen()
	if err != nil {
		return err
	}
	b := &browser{screen: screen, config: os.Args[1]}
	defer func() {
		if b.screen != nil {
			b.screen.close()
		}
	}()
	b.push(b.home())
	if raw, err := os.ReadFile(b.config); err == nil {
		b.current().message = "正在读取订阅…"
		b.draw()
		b.current().message = ""
		if err = b.openSubscription(string(raw)); err != nil {
			b.current().message = err.Error()
		}
	}
	for {
		if b.keyboard != nil {
			b.keyboard.draw(b.screen)
		} else {
			b.draw()
		}
		action := b.screen.action()
		for action == "" {
			action = b.screen.action()
		}
		if action == "quit" {
			return nil
		}
		if b.keyboard != nil {
			b.edit(action)
			continue
		}
		v := b.current()
		switch action {
		case "back":
			if len(b.stack) == 1 {
				return nil
			}
			b.stack = b.stack[:len(b.stack)-1]
		case "up":
			v.selected = max(0, v.selected-1)
		case "down":
			v.selected = max(0, min(len(v.rows)-1, v.selected+1))
		case "page-prev", "page-next":
			if v.reload == nil {
				continue
			}
			page := v.page + 1
			if action == "page-prev" {
				page = v.page - 1
			}
			if page < 1 || page > v.pages {
				continue
			}
			v.message = "正在加载…"
			b.draw()
			v.message = ""
			if err := v.reload(page); err != nil {
				v.message = err.Error()
			}
		case "select":
			if len(v.rows) == 0 {
				continue
			}
			v.message = "正在加载…"
			b.draw()
			v.message = ""
			if err := v.rows[v.selected].open(); err != nil {
				if b.screen == nil {
					return err
				}
				v.message = err.Error()
			}
		}
	}
}
