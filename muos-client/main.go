package main

import (
	"bufio"
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	"strings"
	"time"

	"golang.org/x/term"
)

type settings struct {
	Server string `json:"server"`
	Token  string `json:"token"`
}

type client struct {
	settings
	http *http.Client
}

func connect(cfg settings) (*client, error) {
	cfg.Server = strings.TrimRight(strings.TrimSpace(cfg.Server), "/")
	u, err := url.Parse(cfg.Server)
	if err != nil || u.Hostname() == "" || u.User != nil || u.RawQuery != "" || u.Fragment != "" ||
		(u.Scheme != "https" && u.Scheme != "http") {
		return nil, errors.New("请输入完整的 HTTP 或 HTTPS 服务地址")
	}
	return &client{cfg, &http.Client{
		Timeout:       8 * time.Second,
		CheckRedirect: func(*http.Request, []*http.Request) error { return http.ErrUseLastResponse },
	}}, nil
}

func (c *client) call(method, path string, body, out any) error {
	var reader io.Reader
	if body != nil {
		data, err := json.Marshal(body)
		if err != nil {
			return err
		}
		reader = bytes.NewReader(data)
	}
	req, err := http.NewRequest(method, c.Server+path, reader)
	if err != nil {
		return err
	}
	req.Header.Set("User-Agent", "ContinueBox-muOS/0.1")
	if reader != nil {
		req.Header.Set("Content-Type", "application/json")
	}
	if c.Token != "" {
		req.Header.Set("Authorization", "Bearer "+c.Token)
	}
	res, err := c.http.Do(req)
	if err != nil {
		return errors.New("无法连接续映服务器，请检查网络、地址和证书")
	}
	defer res.Body.Close()
	if res.StatusCode < 200 || res.StatusCode >= 300 {
		return fmt.Errorf("续映服务器返回 HTTP %d", res.StatusCode)
	}
	if out == nil {
		return nil
	}
	return json.NewDecoder(io.LimitReader(res.Body, 4<<20)).Decode(out)
}

type media struct {
	ID       string `json:"id"`
	Name     string `json:"name"`
	Subtitle string `json:"subtitle"`
	Type     string `json:"type"`
	Note     string `json:"note"`
	Position int64  `json:"position_ms"`
	Duration int64  `json:"runtime_ms"`
}

type catalog struct {
	Items []media `json:"items"`
	Total int     `json:"total"`
}

func (m media) label() string {
	if m.Subtitle != "" {
		return m.Name + " · " + m.Subtitle
	}
	return m.Name
}

func (c *client) episodes(m media) ([]media, error) {
	var detail struct {
		List []struct {
			Links string `json:"vod_play_url"`
		} `json:"list"`
	}
	if err := c.call("GET", "/api/v1/emby/item/"+url.PathEscape(m.ID), nil, &detail); err != nil {
		return nil, err
	}
	var rows []media
	if len(detail.List) != 0 {
		for _, segment := range strings.Split(detail.List[0].Links, "#") {
			label, id, ok := strings.Cut(segment, "$")
			if ok && id != "" {
				rows = append(rows, media{ID: id, Name: m.Name, Subtitle: label, Type: "Episode", Note: label})
			}
		}
	}
	return rows, nil
}

func setup() error {
	in := bufio.NewReader(os.Stdin)
	fmt.Print("ContinueBox server URL: ")
	server, _ := in.ReadString('\n')
	c, err := connect(settings{Server: server})
	if err != nil {
		return err
	}
	fmt.Print("Username: ")
	username, _ := in.ReadString('\n')
	fmt.Print("Password: ")
	password, err := term.ReadPassword(int(os.Stdin.Fd()))
	fmt.Println()
	if err != nil {
		return errors.New("run setup in a terminal")
	}
	var session struct {
		Token string `json:"token"`
	}
	err = c.call("POST", "/api/v1/auth/login", map[string]string{
		"username": strings.TrimSpace(username), "password": string(password),
	}, &session)
	if err != nil {
		return err
	}
	if session.Token == "" {
		return errors.New("服务器未返回登录令牌")
	}
	c.Token = session.Token
	var status struct {
		Connected bool `json:"connected"`
	}
	if err = c.call("GET", "/api/v1/emby/status", nil, &status); err != nil {
		return err
	}
	if !status.Connected {
		return errors.New("服务器尚未为这个账号配置 Emby")
	}
	raw, err := json.MarshalIndent(c.settings, "", "  ")
	if err != nil {
		return err
	}
	file, err := os.OpenFile("continuebox.json", os.O_WRONLY|os.O_CREATE|os.O_EXCL, 0600)
	if err != nil {
		return err
	}
	defer file.Close()
	if _, err = file.Write(raw); err != nil {
		return err
	}
	path, _ := filepath.Abs(file.Name())
	fmt.Println("Copy this file to the root of SD1:", path)
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
