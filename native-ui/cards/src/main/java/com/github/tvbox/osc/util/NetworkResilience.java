package com.github.tvbox.osc.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.os.Build;
import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import javax.net.ssl.SSLException;
import okhttp3.ConnectionPool;
import okhttp3.Interceptor;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/** Shares a short idle pool without interrupting active playback or changing DNS/TLS/proxy. */
public final class NetworkResilience implements Interceptor {
    private static final ConnectionPool POOL = new ConnectionPool(8, 20, TimeUnit.SECONDS);
    private static boolean observing;

    public static void install(OkHttpClient.Builder builder) {
        builder.connectionPool(POOL);
        boolean present = false;
        for (Interceptor interceptor : builder.interceptors()) {
            if (interceptor instanceof NetworkResilience) present = true;
        }
        if (!present) builder.addInterceptor(new NetworkResilience());
        observeNetwork();
    }

    private static synchronized void observeNetwork() {
        if (observing) return;
        try {
            Class<?> app = Class.forName("com.github.tvbox.osc.base.App");
            Context context = (Context) app.getMethod("getInstance").invoke(null);
            if (context == null || Build.VERSION.SDK_INT < 24) return;
            ConnectivityManager manager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (manager == null) return;
            manager.registerDefaultNetworkCallback(new ConnectivityManager.NetworkCallback() {
                @Override public void onAvailable(Network network) { POOL.evictAll(); }
                @Override public void onLost(Network network) { POOL.evictAll(); }
            });
            observing = true;
        } catch (Exception ignored) {
            // Missing permission or an older device retains the ordinary connection path.
        }
    }

    private static boolean replayable(Request request) {
        String method = request.method();
        if (!(method.equals("GET") || method.equals("HEAD"))) return false;
        String path = request.url().encodedPath().toLowerCase(Locale.ROOT);
        if (path.equals("/proxy") || path.equals("/action") || path.contains("/callback") ||
            path.contains("/oauth") || path.contains("/logout") || path.contains("/register") ||
            path.contains("/delete")) return false;
        for (String key : request.url().queryParameterNames()) {
            if (key.equalsIgnoreCase("do") || key.equalsIgnoreCase("go") ||
                key.equalsIgnoreCase("action") || key.equalsIgnoreCase("code") ||
                key.equalsIgnoreCase("password")) return false;
        }
        return true;
    }

    private static boolean transientDisconnect(IOException error) {
        if (error instanceof SSLException || error instanceof SocketTimeoutException ||
            error instanceof InterruptedIOException) return false;
        if (error instanceof EOFException) return true;
        if (!(error instanceof SocketException)) return false;
        String message = error.getMessage();
        if (message == null) return false;
        message = message.toLowerCase(Locale.ROOT);
        return message.contains("reset") || message.contains("broken pipe") || message.contains("closed");
    }

    @Override public Response intercept(Chain chain) throws IOException {
        Request request = chain.request();
        try {
            return chain.proceed(request);
        } catch (IOException error) {
            if (!replayable(request) || !transientDisconnect(error) || chain.call().isCanceled()) throw error;
            POOL.evictAll();
            try { Thread.sleep(250); }
            catch (InterruptedException interrupted) {
                Thread.currentThread().interrupt();
                throw new InterruptedIOException("Request interrupted");
            }
            if (chain.call().isCanceled()) throw error;
            // One application retry, preserving range, cookies, credentials and the original URL.
            return chain.proceed(request);
        }
    }
}
