package com.github.tvbox.osc.sync;

import android.app.AlertDialog;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import org.json.JSONObject;

import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/** Login UI for a self-hosted ContinueBox sync server. */
public final class SyncLoginDialog {
    private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    private static final OkHttpClient HTTP = new OkHttpClient.Builder()
            .connectTimeout(5, TimeUnit.SECONDS)
            .readTimeout(8, TimeUnit.SECONDS)
            .writeTimeout(8, TimeUnit.SECONDS)
            .build();

    private SyncLoginDialog() { }

    public static void show(Context context) {
        LinearLayout box = new LinearLayout(context);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(24, 24, 24, 0);
        EditText endpoint = new EditText(context);
        endpoint.setHint("NAS 地址和端口，例如 100.x.x.x:8080");
        List<SyncServerProfile> profiles = SyncServerProfile.all();
        if (!profiles.isEmpty()) endpoint.setText(profiles.get(0).endpoint.replaceFirst("^https?://", ""));
        EditText username = new EditText(context); username.setHint("用户名（3–32 位：字母、数字、._-）");
        EditText password = new EditText(context); password.setHint("密码（至少 8 位）");
        password.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        box.addView(endpoint); box.addView(username); box.addView(password);

        AlertDialog dialog = new AlertDialog.Builder(context).setTitle("播放记录同步").setView(box)
                .setNegativeButton("取消", null).setNeutralButton("注册", null).setPositiveButton("登录", null).create();
        dialog.setOnShowListener(ignored -> {
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> auth(context, dialog, endpoint, username, password, false));
            dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(v -> auth(context, dialog, endpoint, username, password, true));
        });
        dialog.show();
    }

    private static void auth(Context context, AlertDialog dialog, EditText endpointField, EditText usernameField,
                             EditText passwordField, boolean register) {
        String input = endpointField.getText().toString().trim().replaceAll("/+$", "");
        final String base = (input.startsWith("http://") || input.startsWith("https://")) ? input : "http://" + input;
        final String username = usernameField.getText().toString().trim();
        final String password = passwordField.getText().toString();
        if (input.isEmpty() || username.isEmpty() || password.isEmpty()) {
            toast(context, "请填写 NAS 地址、用户名和密码"); return;
        }
        if (!username.matches("^[A-Za-z0-9_.-]{3,32}$")) {
            toast(context, "用户名需为 3–32 位字母、数字或 ._- "); return;
        }
        if (password.length() < 8) { toast(context, "密码至少需要 8 位"); return; }
        if (okhttp3.HttpUrl.parse(base) == null) { toast(context, "NAS 地址格式不正确"); return; }

        Executors.newSingleThreadExecutor().execute(() -> {
            try {
                Request health = new Request.Builder().url(base + "/health").get().build();
                try (Response response = HTTP.newCall(health).execute()) {
                    if (!response.isSuccessful()) throw new Exception("服务器健康检查失败（HTTP " + response.code() + "）");
                }
                JSONObject credentials = new JSONObject();
                credentials.put("username", username); credentials.put("password", password);
                String path = register ? "/api/v1/auth/register" : "/api/v1/auth/login";
                Request request = new Request.Builder().url(base + path).post(RequestBody.create(JSON, credentials.toString())).build();
                try (Response response = HTTP.newCall(request).execute()) {
                    String content = response.body() == null ? "" : response.body().string();
                    if (!response.isSuccessful()) throw new Exception(serverError(response.code(), content));
                    String token = new JSONObject(content).getString("token");
                    SyncServerProfile.activate(new SyncServerProfile(username, base, token));
                }
                new Handler(Looper.getMainLooper()).post(() -> { dialog.dismiss(); toast(context, "登录成功，已开始同步"); TvboxSyncClient.pull(); });
            } catch (Exception error) {
                String message = error.getMessage();
                if (message == null || message.trim().isEmpty()) message = "无法连接到服务器，请检查 NAS 地址、端口和 Tailscale 网络";
                final String visible = message;
                new Handler(Looper.getMainLooper()).post(() -> toast(context, visible));
            }
        });
    }

    private static String serverError(int code, String content) {
        try { return new JSONObject(content).optString("detail", "服务器返回 HTTP " + code); }
        catch (Exception ignored) { return "服务器返回 HTTP " + code; }
    }

    private static void toast(Context context, String message) {
        Toast.makeText(context, message, Toast.LENGTH_LONG).show();
    }
}
