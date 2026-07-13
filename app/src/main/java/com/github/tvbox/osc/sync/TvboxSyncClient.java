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

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/**
 * Reliable, eventually-consistent playback history synchronization.
 *
 * Every update is first stored in a local outbox. The outbox is drained by one
 * network worker only, so a slow request, app exit, or temporary network loss
 * cannot replace an unsent record with a newer unrelated video.
 */
public final class TvboxSyncClient {
    public interface Callback { void complete(boolean success); }

    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    private static final String DIRTY = "sync_push_pending";
    private static final String OUTBOX = "sync_outbox_v2";
    private static final String CURSOR = "sync_cursor_v2";
    private static final String RETRY_AT = "sync_retry_at";
    private static final String RETRY_COUNT = "sync_retry_count";
    private static final Object OUTBOX_LOCK = new Object();
    private static final AtomicBoolean PUSHING = new AtomicBoolean(false);
    private static final AtomicBoolean PULLING = new AtomicBoolean(false);
    private static volatile boolean pullAfterPush;
    private static final OkHttpClient HTTP = new OkHttpClient.Builder()
            .connectTimeout(4, TimeUnit.SECONDS)
            .readTimeout(8, TimeUnit.SECONDS)
            .writeTimeout(8, TimeUnit.SECONDS)
            .retryOnConnectionFailure(true)
            .build();

    private TvboxSyncClient() { }

    public static boolean enabled() {
        return !value("sync_endpoint").trim().isEmpty() && !value("sync_token").trim().isEmpty();
    }

    /** Queues the latest local record before attempting delivery. */
    public static void pushLatest() {
        if (!enabled()) return;
        try {
            List<VodRecord> rows = AppDataManager.get().getVodRecordDao().getAll(1);
            if (rows != null && !rows.isEmpty()) enqueue(rows.get(0));
        } catch (Exception ignored) { }
        drainOutbox(false);
    }

    /** Called by the playback record store whenever a position is persisted locally. */
    public static void push(VodRecord record) {
        if (!enabled() || record == null) return;
        enqueue(record);
        drainOutbox(false);
    }

    /** Replays every unsent record when the app starts or returns to foreground. */
    public static void retryPending() {
        if (Hawk.get(DIRTY, false) || !outbox().entrySet().isEmpty()) drainOutbox(true);
    }

    public static void pull() { pull(null); }

    public static void pull(final Callback callback) {
        if (!enabled()) { done(callback, false); return; }
        // Never apply remote state while a local update is still waiting to be delivered.
        if (PUSHING.get() || hasPending()) {
            pullAfterPush = true;
            drainOutbox(true);
            done(callback, false);
            return;
        }
        startPull(callback);
    }

    private static void startPull(final Callback callback) {
        if (!PULLING.compareAndSet(false, true)) { done(callback, false); return; }
        final String endpoint = endpoint();
        final String token = value("sync_token").trim();
        final long cursor = longValue(CURSOR, 0L);
        AsyncTask.execute(() -> {
            boolean success = false;
            long nextCursor = cursor;
            try {
                // v2 uses a server sequence cursor instead of wall-clock time, preventing missed ties.
                Request request = new Request.Builder()
                        .url(endpoint + "/api/v1/sync/pull-v2?after=" + cursor)
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
                    if (result.has("cursor")) nextCursor = result.get("cursor").getAsLong();
                    success = true;
                }
            } catch (Exception ignored) { }
            if (success) Hawk.put(CURSOR, String.valueOf(nextCursor));
            PULLING.set(false);
            done(callback, success);
        });
    }

    private static void enqueue(VodRecord record) {
        try {
            JsonObject item = recordItem(record);
            if (item == null) return;
            synchronized (OUTBOX_LOCK) {
                JsonObject pending = outbox();
                pending.add(recordKey(item), item); // keep only the newest snapshot of each episode
                saveOutbox(pending);
            }
        } catch (Exception ignored) { }
    }

    private static void drainOutbox(boolean force) {
        if (!enabled() || (!force && System.currentTimeMillis() < longValue(RETRY_AT, 0L))) return;
        if (!PUSHING.compareAndSet(false, true)) return;
        AsyncTask.execute(() -> {
            boolean sent = false;
            try {
                while (true) {
                    JsonObject pending;
                    JsonArray batch = new JsonArray();
                    List<String> keys = new ArrayList<>();
                    synchronized (OUTBOX_LOCK) {
                        pending = outbox();
                        for (String key : pending.keySet()) {
                            if (keys.size() == 100) break;
                            keys.add(key); batch.add(pending.get(key));
                        }
                    }
                    if (keys.isEmpty()) { sent = true; break; }
                    JsonObject body = new JsonObject();
                    body.addProperty("device_id", deviceId()); body.add("records", batch);
                    Request request = new Request.Builder().url(endpoint() + "/api/v1/sync/push")
                            .addHeader("Authorization", "Bearer " + value("sync_token").trim())
                            .post(RequestBody.create(JSON, body.toString())).build();
                    try (Response response = HTTP.newCall(request).execute()) {
                        if (!response.isSuccessful()) throw new Exception("push failed");
                    }
                    synchronized (OUTBOX_LOCK) {
                        JsonObject latest = outbox();
                        for (String key : keys) {
                            // Do not erase a newer snapshot queued while this request was in flight.
                            if (latest.has(key) && pending.has(key) && latest.get(key).equals(pending.get(key))) latest.remove(key);
                        }
                        saveOutbox(latest);
                    }
                }
            } catch (Exception ignored) { }
            if (sent) {
                Hawk.put(RETRY_COUNT, 0); Hawk.put(RETRY_AT, 0L);
            } else {
                int attempt = Math.min(6, (int) longValue(RETRY_COUNT, 0L) + 1);
                Hawk.put(RETRY_COUNT, attempt);
                Hawk.put(RETRY_AT, System.currentTimeMillis() + (1000L << attempt)); // 2s … 64s
            }
            PUSHING.set(false);
            if (pullAfterPush && !hasPending()) { pullAfterPush = false; startPull(null); }
        });
    }

    private static JsonObject recordItem(VodRecord record) {
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
        item.addProperty("deleted", false); item.addProperty("data_json", record.dataJson);
        return item;
    }

    private static boolean hasPending() { synchronized (OUTBOX_LOCK) { return !outbox().entrySet().isEmpty(); } }
    private static JsonObject outbox() {
        try { return new JsonParser().parse(value(OUTBOX, "{}")).getAsJsonObject(); }
        catch (Exception ignored) { return new JsonObject(); }
    }
    private static void saveOutbox(JsonObject pending) { Hawk.put(OUTBOX, pending.toString()); Hawk.put(DIRTY, !pending.entrySet().isEmpty()); }
    private static String recordKey(JsonObject item) { return string(item, "source_key") + "\u0000" + string(item, "video_id") + "\u0000" + string(item, "episode_id"); }
    private static String endpoint() { return value("sync_endpoint").trim().replaceAll("/$", ""); }
    private static String value(String key) { return value(key, ""); }
    private static String value(String key, String fallback) { Object value = Hawk.get(key, fallback); return value == null ? fallback : value.toString(); }
    private static long longValue(String key, long fallback) { try { return Long.parseLong(value(key, String.valueOf(fallback))); } catch (Exception ignored) { return fallback; } }
    private static String string(JsonObject object, String key) { return object.has(key) && !object.get(key).isJsonNull() ? object.get(key).getAsString() : ""; }
    private static String deviceId() { String id = value("sync_device"); if (id.isEmpty()) { id = UUID.randomUUID().toString(); Hawk.put("sync_device", id); } return id; }
    private static void done(Callback callback, boolean success) { if (callback != null) callback.complete(success); }
}
