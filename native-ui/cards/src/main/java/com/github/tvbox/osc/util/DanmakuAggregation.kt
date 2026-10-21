package com.github.tvbox.osc.util

import android.os.Handler
import android.os.Looper
import android.util.Xml
import java.io.StringReader
import java.lang.reflect.Proxy
import java.net.URI
import java.net.URLDecoder
import java.net.URLEncoder
import java.security.MessageDigest
import java.util.Locale
import java.util.concurrent.atomic.AtomicBoolean
import org.xmlpull.v1.XmlPullParser

/** Keeps public source identifiers independent from signed/private playback URLs. */
object DanmakuAggregation {
    private val handler = Handler(Looper.getMainLooper())
    private data class Source(val title: String, val episode: String, val id: String)
    @Volatile private var source: Source? = null
    private val platforms = setOf("www.bilibili.com", "m.bilibili.com", "v.qq.com", "www.iqiyi.com", "www.mgtv.com", "v.youku.com")

    @JvmStatic fun sourceId(value: String): String {
        if (value.isBlank() || value.length > 8192) return ""
        return try {
            val uri = URI(value.trim())
            if (uri.scheme !in listOf("http", "https")) return ""
            val host = uri.host?.lowercase(Locale.ROOT) ?: return ""
            if (host in platforms && uri.userInfo == null && uri.port == -1 &&
                (uri.rawPath ?: "").matches(Regex("/[a-zA-Z0-9_./~-]{1,300}"))) {
                val query = (uri.rawQuery ?: "").split('&').mapNotNull {
                    val pair = it.split('=', limit = 2)
                    val k = URLDecoder.decode(pair[0], "UTF-8")
                    val v = URLDecoder.decode(pair.getOrElse(1) { "" }, "UTF-8")
                    if (k in setOf("id", "vid", "aid", "cid", "p") && v.matches(Regex("[a-zA-Z0-9_-]{1,64}"))) "$k=$v" else null
                }.joinToString("&")
                "https://$host${uri.rawPath}" + if (query.isEmpty()) "" else "?$query"
            } else MessageDigest.getInstance("MD5").digest(value.toByteArray(Charsets.UTF_8)).joinToString("") { "%02x".format(it.toInt() and 255) }
        } catch (_: Exception) { "" }
    }

    @JvmStatic fun capture(fragment: Any) {
        source = null
        try {
            val cls = fragment.javaClass
            val vod = cls.getDeclaredField("mVodInfo").apply { isAccessible = true }.get(fragment) ?: return
            val vc = vod.javaClass
            val series = cls.getDeclaredMethod("getCurrentSeries", String::class.java, Int::class.javaPrimitiveType)
                .apply { isAccessible = true }.invoke(fragment, vc.getField("playFlag").get(vod), vc.getField("playIndex").get(vod)) ?: return
            val episode = cls.getDeclaredMethod("displayEpisodeName", series.javaClass).apply { isAccessible = true }.invoke(fragment, series)?.toString() ?: ""
            source = Source(vc.getField("name").get(vod)?.toString() ?: "", episode,
                sourceId(series.javaClass.getField("url").get(series)?.toString() ?: ""))
        } catch (_: Exception) { source = null }
    }

    @JvmStatic fun addSource(builder: Any, title: String?, episode: String?) {
        val current = source ?: return
        if (current.title != title || current.episode != (episode ?: "") || current.id.isEmpty()) return
        try { builder.javaClass.getMethod("addQueryParameter", String::class.java, String::class.java).invoke(builder, "source_id", current.id) }
        catch (_: Exception) { /* Older clients can continue using title matching. */ }
    }

    @JvmStatic fun priority(): Int {
        val hawk = Class.forName("com.orhanobut.hawk.Hawk")
        val get = hawk.getMethod("get", String::class.java, Any::class.java)
        val put = hawk.getMethod("put", String::class.java, Any::class.java)
        if (get.invoke(null, "danmu_aggregate_221", false) != true) {
            put.invoke(null, "danmu_source_priority", 4)
            put.invoke(null, "danmu_aggregate_221", true)
        }
        return ((get.invoke(null, "danmu_source_priority", 4) as? Number)?.toInt() ?: 4).coerceIn(0, 4)
    }

    @JvmStatic fun search(title: String?, episode: String?, year: Int, tmdbId: Int, mediaType: String?, season: Int, number: Int, callback: Any?) {
        if (callback == null) return
        val api = Class.forName("com.github.tvbox.osc.api.DanmakuApi")
        val cb = Class.forName("com.github.tvbox.osc.api.DanmakuApi\$SearchCallback")
        val complete = AtomicBoolean(false)
        val values = arrayOf("", "")
        val done = booleanArrayOf(false, false)
        fun deliver() {
            if (!complete.compareAndSet(false, true)) return
            val merged = values.filter { it.isNotBlank() }.distinct().joinToString("\n<!-- continuebox:danmaku-source -->\n")
            if (merged.isEmpty()) cb.getMethod("onNotFound").invoke(callback)
            else cb.getMethod("onFound", String::class.java).invoke(callback, merged)
        }
        val deadline = Runnable { deliver() }
        handler.postDelayed(deadline, 24000)
        fun receive(index: Int, value: String) {
            handler.post {
                if (!done[index] && !complete.get()) {
                    done[index] = true
                    values[index] = value
                    if (done.all { it }) { handler.removeCallbacks(deadline); deliver() }
                }
            }
        }
        fun proxy(index: Int): Any = Proxy.newProxyInstance(cb.classLoader, arrayOf(cb)) { obj, method, args ->
            when (method.name) {
                "onFound" -> { receive(index, args?.getOrNull(0)?.toString() ?: ""); null }
                "onNotFound" -> { receive(index, ""); null }
                "hashCode" -> System.identityHashCode(obj)
                "equals" -> obj === args?.getOrNull(0)
                "toString" -> "ContinueBoxDanmakuCallback"
                else -> null
            }
        }
        try {
            val enabled = Class.forName("com.github.tvbox.osc.sync.IntegrationClient").getMethod("enabled").invoke(null) == true
            if (enabled) api.getDeclaredMethod("searchIntegration", String::class.java, String::class.java,
                Int::class.javaPrimitiveType, Int::class.javaPrimitiveType, String::class.java, Int::class.javaPrimitiveType,
                Int::class.javaPrimitiveType, cb, Boolean::class.javaPrimitiveType).apply { isAccessible = true }
                .invoke(null, title ?: "", episode ?: "", year, tmdbId, mediaType ?: "", season, number, proxy(0), false)
            else receive(0, "")
        } catch (_: Exception) { receive(0, "") }
        try {
            val configured = api.getDeclaredMethod("getApiUrl").apply { isAccessible = true }.invoke(null)?.toString().orEmpty()
            if (configured.isNotEmpty()) api.getDeclaredMethod("searchLegacy", String::class.java, String::class.java, cb)
                .apply { isAccessible = true }.invoke(null, title ?: "", episode ?: "", proxy(1))
            else receive(1, "")
        } catch (_: Exception) { receive(1, "") }
    }

    @JvmStatic fun cleanXml(input: String?): String {
        val xml = input ?: return ""
        if (!xml.trimStart().startsWith("<")) return xml
        if (xml.length > 8 * 1024 * 1024 || Regex("<!\\s*(DOCTYPE|ENTITY)", RegexOption.IGNORE_CASE).containsMatchIn(xml)) return "<i></i>"
        return try {
            val parser = Xml.newPullParser()
            parser.setInput(StringReader(xml))
            val result = StringBuilder("<i>")
            val seen = HashSet<String>()
            while (parser.next() != XmlPullParser.END_DOCUMENT && seen.size < 30000) {
                if (parser.eventType != XmlPullParser.START_TAG || parser.name != "d") continue
                val fields = (parser.getAttributeValue(null, "p") ?: "").split(',')
                val message = parser.nextText().replace(Regex("[\\x00-\\x08\\x0b\\x0c\\x0e-\\x1f]"), "").trim().take(500)
                if (fields.size < 4 || message.isEmpty()) continue
                val time = fields[0].toDoubleOrNull() ?: continue
                val mode = fields[1].toIntOrNull() ?: continue
                val color = fields[3].toIntOrNull() ?: continue
                if (!time.isFinite() || time < 0 || time > 86400 || mode !in listOf(1, 4, 5) || color !in 0..16777215) continue
                val stamp = String.format(Locale.US, "%.2f", time)
                if (!seen.add("$stamp|$mode|$color|$message")) continue
                val escaped = message.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
                result.append("<d p=\"$stamp,$mode,25,$color\">$escaped</d>")
            }
            result.append("</i>").toString()
        } catch (_: Exception) { "<i></i>" }
    }
}
