package main

import (
	"encoding/json"
	"errors"
	"io"
	"net"
	"net/http"
	"strings"
	"time"
)

func playbackHeaders(raw json.RawMessage) (http.Header, error) {
	value := strings.TrimSpace(string(raw))
	if strings.HasPrefix(value, `"`) {
		if err := json.Unmarshal(raw, &value); err != nil {
			return nil, errors.New("播放请求头格式无效")
		}
	}
	if value == "" || value == "null" {
		return nil, nil
	}
	fields := map[string]string{}
	if json.Unmarshal([]byte(value), &fields) != nil {
		return nil, errors.New("播放请求头格式无效")
	}
	headers := http.Header{}
	for key, field := range fields {
		if field == "" {
			continue
		}
		switch http.CanonicalHeaderKey(key) {
		case "Referer", "Origin", "User-Agent":
			if len(field) > 4096 || strings.ContainsAny(field, "\r\n\x00") {
				return nil, errors.New("播放请求头格式无效")
			}
			headers.Set(key, field)
		default:
			return nil, errors.New("这条线路要求额外请求头，请换一条直连线路")
		}
	}
	return headers, nil
}

func (stream playbackStream) playerAddress() (string, func(), error) {
	noCleanup := func() {}
	if stream.extension == ".m3u8" || stream.extension == ".m3u" {
		if len(stream.headers) > 0 {
			return "", noCleanup, errors.New("这条 HLS 线路要求自定义请求头，请换一条线路")
		}
		return stream.url, noCleanup, nil
	}
	if len(stream.headers) == 0 && stream.extension != ".mp4" {
		return stream.url, noCleanup, nil
	}
	socket, err := net.Listen("tcp4", "127.0.0.1:0")
	if err != nil {
		return "", noCleanup, errors.New("无法启动本机视频转发")
	}
	route := "/video" + stream.extension
	transport := http.DefaultTransport.(*http.Transport).Clone()
	transport.ResponseHeaderTimeout = 10 * time.Second
	client := &http.Client{Transport: transport, CheckRedirect: network.CheckRedirect}
	server := &http.Server{ReadHeaderTimeout: 5 * time.Second, Handler: http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path != route || (r.Method != http.MethodGet && r.Method != http.MethodHead) {
			http.NotFound(w, r)
			return
		}
		req, err := http.NewRequestWithContext(r.Context(), r.Method, stream.url, nil)
		if err != nil {
			w.WriteHeader(http.StatusBadGateway)
			return
		}
		if stream.headers != nil {
			req.Header = stream.headers.Clone()
		}
		for _, name := range []string{"Range", "If-Range"} {
			if value := r.Header.Get(name); value != "" {
				req.Header.Set(name, value)
			}
		}
		res, err := client.Do(req)
		if err != nil {
			w.WriteHeader(http.StatusBadGateway)
			return
		}
		defer res.Body.Close()
		for _, name := range []string{"Content-Type", "Content-Length", "Content-Range", "Accept-Ranges", "Last-Modified", "ETag"} {
			if value := res.Header.Get(name); value != "" {
				w.Header().Set(name, value)
			}
		}
		if stream.extension == ".mp4" && (res.StatusCode == http.StatusOK || res.StatusCode == http.StatusPartialContent) {
			contentType := w.Header().Get("Content-Type")
			if contentType == "" || strings.HasPrefix(contentType, "application/octet-stream") {
				w.Header().Set("Content-Type", "video/mp4")
			}
		}
		w.WriteHeader(res.StatusCode)
		_, _ = io.Copy(w, res.Body)
	})}
	go server.Serve(socket)
	return "http://" + socket.Addr().String() + route, func() {
		_ = server.Close()
		transport.CloseIdleConnections()
	}, nil
}
