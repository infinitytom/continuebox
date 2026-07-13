package com.github.tvbox.osc.sync;

import android.os.AsyncTask;

import com.github.tvbox.osc.cache.RoomDataManger;
import com.github.tvbox.osc.cache.VodRecord;
import com.github.tvbox.osc.data.AppDataManager;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.orhanobut.hawk.Hawk;

import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/** Lightweight, eventually-consistent playback history synchronization. */
public final class TvboxSyncClient {
    public interface Callback { void complete(boolean success); }

    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    private static final String DIRTY = "sync_push_pending";
    private static final OkHttpClient HTTP = new OkHttpClient.Builder()
            .connectTimeout(4, TimeUnit.SECONDS)
            .readTimeout(6, TimeUnit.SECONDS)
            .writeTimeout(6, TimeUnit.SECONDS)
            .retryOnConnectionFailure(true)
            .build();

    private TvboxSyncClient() { }

    public static boolean enabled() {
        return !value("sync_endpoint").trim().isEmpty() && !value("sync_token").trim().isEmpty();
    }

    public static void pushLatest() {
        if (!enabled()) return;
        try {
            List<VodRecord> rows = AppDataManager.get().getVodRecordDao().getAll(1);
            if (rows != null && !rows.isEmpty()) push(rows.get(0));
        } catch (Exception ignored) { }
    }

    /** Replays a failed upload when the app next starts or returns to foreground. */
    public static void retryPending() {
        if (Hawk.get(DIRTY, false)) pushLatest();
    }

    public static void pull() { pull(null); }

    public static void pull(final Callback callback) {
        if (!enabled()) { done(callback, false); return; }
        final String endpoint = endpoint();
        final String token = value("sync_token").trim();
        final long cursor;
        try {
            cursor = Long.parseLong(value("sync_cursor", "0"));
        } catch (Exception badCursor) {
            Hawk.put("sync_cursor", "0");
            done(callback, false);
            return;
        }
        AsyncTask.execute(() -> {
            boolean success = false;
            try {
                Request request = new Request.Builder()
                        .url(endpoint + "/api/v1/sync/pull?since=" + cursor)
                        .addHeader("Authorization", "Bearer " + token).get().build();
                try (Response response = HTTP.newCall(request).execute()) {
                    if (!response.isSuccessful() || response.body() == null) throw new Exception("pull failed");
                    JsonObject result = new JsonParser().parse(response.body().string()).getAsJsonObject();
                    if (!result.has("records")) throw new Exception("invalid response");
                    for (JsonElement element : result.getAsJsonArray("records")) {
                        try {
                            JsonObject item = element.getAsJsonObject();
                            if (item.has("deleted") && item.get("deleted").getAsBoolean()) continue;
                            RoomDataManger.upsertSyncedRecord(
                                    item.get("source_key").getAsString(), item.get("video_id").getAsString(),
                                    string(item, "video_name"), string(item, "episode_id"),
                                    string(item, "episode_name"), item.get("updated_at").getAsLong(),
                                    string(item, "data_json"));
                        } catch (Exception ignoredRecord) { }
                    }
                    if (result.has("cursor")) Hawk.put("sync_cursor", result.get("cursor").getAsLong());
                    success = true;
                }
            } catch (Exception ignored) { }
            done(callback, success);
        });
    }

    public static void push(final VodRecord record) {
        if (!enabled() || record == null) return;
        Hawk.put(DIRTY, true);
        final Request request;
        try {
            JsonObject vod = new JsonParser().parse(record.dataJson).getAsJsonObject();
            JsonObject item = new JsonObject();
            item.addProperty("source_key", record.sourceKey);
            item.addProperty("video_id", record.vodId);
            item.addProperty("video_name", string(vod, "name"));
            item.addProperty("episode_id", vod.has("playFlag") ? vod.get("playFlag").getAsString() + "#" + vod.get("playIndex").getAsInt() : "");
            item.addProperty("episode_name", string(vod, "playNote"));
            item.addProperty("position_ms", vod.has("playPosition") ? vod.get("playPosition").getAsLong() : 0);
            item.addProperty("duration_ms", vod.has("playDuration") ? vod.get("playDuration").getAsLong() : 0);
            item.addProperty("updated_at", record.updateTime);
            item.addProperty("deleted", false);
            item.addProperty("data_json", record.dataJson);
            JsonArray records = new JsonArray(); records.add(item);
            JsonObject body = new JsonObject();
            body.addProperty("device_id", deviceId()); body.add("records", records);
            request = new Request.Builder().url(endpoint() + "/api/v1/sync/push")
                    .addHeader("Authorization", "Bearer " + value("sync_token").trim())
                    .post(RequestBody.create(JSON, body.toString())).build();
        } catch (Exception ignored) { return; }
        AsyncTask.execute(() -> {
            try (Response response = HTTP.newCall(request).execute()) {
                if (response.isSuccessful()) Hawk.put(DIRTY, false);
            } catch (Exception ignored) { }
        });
    }

    private static String endpoint() { return value("sync_endpoint").trim().replaceAll("/$", ""); }
    private static String value(String key) { return value(key, ""); }
    private static String value(String key, String fallback) { Object value = Hawk.get(key, fallback); return value == null ? fallback : value.toString(); }
    private static String string(JsonObject object, String key) { return object.has(key) && !object.get(key).isJsonNull() ? object.get(key).getAsString() : ""; }
    private static String deviceId() { String id = value("sync_device"); if (id.isEmpty()) { id = UUID.randomUUID().toString(); Hawk.put("sync_device", id); } return id; }
    private static void done(Callback callback, boolean success) { if (callback != null) callback.complete(success); }
}
