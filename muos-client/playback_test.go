package main

import (
	"fmt"
	"io"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestExtensionlessMP4WithHeaders(t *testing.T) {
	mux := http.NewServeMux()
	mux.HandleFunc("/vod", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, `{"url":"/media?id=one","parse":0,"header":"{\"Referer\":\"https://example.org/watch\",\"User-Agent\":\"TVBox sample\"}"}`)
	})
	mux.HandleFunc("/media", func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Referer") != "https://example.org/watch" || r.Header.Get("User-Agent") != "TVBox sample" || r.URL.Query().Get("id") != "one" {
			t.Error("required upstream request settings missing")
			w.WriteHeader(http.StatusForbidden)
			return
		}
		w.Header().Set("Content-Type", "application/octet-stream")
		w.Header().Set("Accept-Ranges", "bytes")
		switch r.Header.Get("Range") {
		case "bytes=0-511":
			w.Header().Set("Content-Range", "bytes 0-7/64")
			w.WriteHeader(http.StatusPartialContent)
			_, _ = io.WriteString(w, "\x00\x00\x00\x10ftyp")
		case "bytes=16-19":
			w.Header().Set("Content-Range", "bytes 16-19/64")
			w.WriteHeader(http.StatusPartialContent)
			_, _ = io.WriteString(w, "data")
		default:
			t.Error("missing requested byte range")
			w.WriteHeader(http.StatusBadRequest)
		}
	})
	origin := httptest.NewServer(mux)
	defer origin.Close()
	s := site{API: origin.URL + "/vod", Kind: "4"}
	stream, err := s.resolvePlayback(nil, episode{Link: "movie", Flag: "mp4"})
	if err != nil || stream.extension != ".mp4" {
		t.Fatalf("expected MP4 from file signature: %v, %v", stream, err)
	}
	address, closeRelay, err := stream.playerAddress()
	defer closeRelay()
	if err != nil || !strings.HasSuffix(address, "/video.mp4") {
		t.Fatalf("relay: %q, %v", address, err)
	}
	req, _ := http.NewRequest("GET", address, nil)
	req.Header.Set("Range", "bytes=16-19")
	res, err := http.DefaultClient.Do(req)
	if err != nil {
		t.Fatal(err)
	}
	defer res.Body.Close()
	data, err := io.ReadAll(res.Body)
	if err != nil || string(data) != "data" || res.StatusCode != 206 ||
		res.Header.Get("Content-Type") != "video/mp4" || res.Header.Get("Content-Range") != "bytes 16-19/64" {
		t.Fatalf("relay response: %s, %v, %q, %v", res.Status, res.Header, data, err)
	}
}
