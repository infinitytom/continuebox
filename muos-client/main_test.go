package main

import (
	"encoding/base64"
	"fmt"
	"net/http"
	"net/http/httptest"
	"net/url"
	"strings"
	"testing"
)

func TestImageWrappedSubscription(t *testing.T) {
	data := []byte("\xff\xd8\xff\xd9ABCDEFG1**")
	data = append(data, base64.StdEncoding.EncodeToString([]byte(`{"sites":[],"urls":[],}`))...)
	decoded, err := subscriptionJSON(data)
	if err != nil || !strings.Contains(string(decoded), `"sites"`) {
		t.Fatalf("wrapped configuration: %s, %v", decoded, err)
	}
}

func TestTVBoxSubscriptionToPlayback(t *testing.T) {
	router := http.NewServeMux()
	router.HandleFunc("/config", func(w http.ResponseWriter, req *http.Request) {
		fmt.Fprint(w, `{/* comment */"sites":[{"name":"HTTP","type":1,"api":"/api?keep=yes"},{"name":"Android","type":3,"api":"csp_Test"}], "urls":[{"name":"nested","url":"/child"}],}`)
	})
	router.HandleFunc("/api", func(w http.ResponseWriter, req *http.Request) {
		q := req.URL.Query()
		if q.Get("keep") != "yes" {
			t.Error("lost subscription API query")
		}
		switch {
		case q.Has("ids"):
			if q.Get("ac") != "detail" || q.Get("ids") != "42" {
				t.Error("incorrect detail query")
			}
			fmt.Fprint(w, `{"list":[{"vod_id":42,"vod_name":"测试","vod_play_from":"HTTP$$$Other","vod_play_url":"第1集$/video.m3u8#第2集$/episode2.mp4$$$备用$/alt.mp4"}]}`)
		case q.Has("t"):
			if q.Get("ac") != "detail" || q.Get("pg") != "2" {
				t.Error("incorrect page query")
			}
			fmt.Fprint(w, `{"pagecount":3,"list":[{"vod_id":42,"vod_name":"测试"}]}`)
		default:
			fmt.Fprint(w, `{"class":[{"type_id":7,"type_name":"电影"}]}`)
		}
	})
	server := httptest.NewServer(router)
	defer server.Close()
	cfg, err := loadSubscription(server.URL + "/config")
	if err != nil || len(cfg.Sites) != 1 || len(cfg.Links) != 1 || cfg.Skipped != 1 {
		t.Fatalf("subscription: %+v, %v", cfg, err)
	}
	s := cfg.Sites[0]
	home, _, err := s.catalog(url.Values{})
	if err != nil || len(home.Categories) != 1 || home.Categories[0].ID != "7" {
		t.Fatalf("home: %+v, %v", home, err)
	}
	movies, _, err := s.catalog(url.Values{"t": {"7"}, "pg": {"2"}})
	if err != nil || len(movies.Items) != 1 || movies.Pages != "3" {
		t.Fatalf("page: %+v, %v", movies, err)
	}
	detail, base, err := s.catalog(url.Values{"ids": {string(movies.Items[0].ID)}})
	if err != nil || len(detail.Items) != 1 {
		t.Fatalf("detail: %+v, %v", detail, err)
	}
	parts := episodes(detail.Items[0])
	if len(parts) != 3 || parts[2].Flag != "Other" {
		t.Fatalf("episodes: %+v", parts)
	}
	stream, err := s.playback(base, parts[0])
	if err != nil || stream != server.URL+"/video.m3u8" {
		t.Fatalf("play: %q, %v", stream, err)
	}
}

func TestXMLCatalog(t *testing.T) {
	c, err := readXML([]byte(`<?xml version="1.0"?><rss><class><ty id="1">电视剧</ty></class><list pagecount="3"><video><id>1</id><name>测试</name><dl><dd flag="cdn"><![CDATA[正片$https://example.org/sample.mp4]]></dd></dl></video></list></rss>`))
	if err != nil || c.Pages != "3" || len(c.Items) != 1 || len(c.Categories) != 1 {
		t.Fatalf("XML: %+v, %v", c, err)
	}
	if parts := episodes(c.Items[0]); len(parts) != 1 || parts[0].Flag != "cdn" {
		t.Fatalf("parts: %+v", parts)
	}
}

func TestRemotePlaybackAndMediaProbe(t *testing.T) {
	router := http.NewServeMux()
	router.HandleFunc("/vod", func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Query().Get("flag") != "cdn" || r.URL.Query().Get("extend") != "test" {
			t.Error("lost type 4 parameters")
		}
		if r.URL.Query().Get("play") == "needs-parse" {
			fmt.Fprint(w, `{"url":"/stream","parse":1}`)
			return
		}
		fmt.Fprint(w, `{"url":"/stream","parse":0,"header":{}}`)
	})
	router.HandleFunc("/stream", func(w http.ResponseWriter, r *http.Request) {
		if r.Header.Get("Range") != "bytes=0-511" {
			t.Error("expected a bounded range probe")
		}
		w.Header().Set("Content-Type", "application/vnd.apple.mpegurl")
		fmt.Fprint(w, "#EXTM3U\n")
	})
	server := httptest.NewServer(router)
	defer server.Close()
	s := site{API: server.URL + "/vod", Kind: "4", Ext: []byte(`"test"`)}
	stream, err := s.playback(nil, episode{Link: "opaque", Flag: "cdn"})
	if err != nil || stream != server.URL+"/stream" {
		t.Fatalf("play: %q, %v", stream, err)
	}
	if _, err = s.playback(nil, episode{Link: "needs-parse", Flag: "cdn"}); err == nil || !strings.Contains(err.Error(), "网页解析") {
		t.Fatalf("parse: %v", err)
	}
}

func TestUnsupportedAndroidOnlySubscription(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, `{"sites":[{"type":3,"name":"Spider","api":"csp_Test"}]}`)
	}))
	defer server.Close()
	cfg, err := loadSubscription(server.URL)
	if err == nil || cfg.Skipped != 1 || len(cfg.Sites) != 0 {
		t.Fatalf("Android-only configuration: %+v, %v", cfg, err)
	}
}
