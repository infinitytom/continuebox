package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestEmbyEpisodeList(t *testing.T) {
	server := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, req *http.Request) {
		if req.Method != "GET" || req.URL.Path != "/api/v1/emby/item/series-id" ||
			req.Header.Get("Authorization") != "Bearer test-token" {
			t.Errorf("unexpected request: %s %s", req.Method, req.URL.Path)
			w.WriteHeader(http.StatusBadRequest)
			return
		}
		_, _ = w.Write([]byte(`{"list":[{"vod_play_url":"S01E01 第一集$ep1#S01E02 第二集$ep2"}]}`))
	}))
	defer server.Close()
	c, err := connect(settings{Server: server.URL, Token: "test-token"})
	if err != nil {
		t.Fatal(err)
	}
	rows, err := c.episodes(media{ID: "series-id", Name: "片名", Type: "Series"})
	if err != nil {
		t.Fatal(err)
	}
	if len(rows) != 2 || rows[1].ID != "ep2" || rows[1].label() != "片名 · S01E02 第二集" {
		t.Fatalf("unexpected episodes: %+v", rows)
	}
}

func TestLoginDoesNotFollowRedirect(t *testing.T) {
	destination := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		t.Error("credentials must not be forwarded to a redirect destination")
	}))
	defer destination.Close()
	source := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		http.Redirect(w, r, destination.URL, http.StatusTemporaryRedirect)
	}))
	defer source.Close()
	c, err := connect(settings{Server: source.URL})
	if err != nil {
		t.Fatal(err)
	}
	if err = c.call("POST", "/api/v1/auth/login", map[string]string{"password": "example"}, nil); err == nil {
		t.Fatal("expected the login redirect to be rejected")
	}
}
