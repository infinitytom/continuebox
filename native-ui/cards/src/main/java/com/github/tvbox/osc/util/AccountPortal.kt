package com.github.tvbox.osc.util

import android.app.AlertDialog
import android.content.Context
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.text.InputType
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.widget.*
import org.json.JSONObject
import java.net.HttpURLConnection
import java.net.URI
import java.net.URL
import java.net.InetAddress
import java.io.IOException
import java.util.UUID
import java.util.concurrent.Executors

/** Native account surface. Existing engine remains responsible for account-scoped caches. */
object AccountPortal {
    private val worker = Executors.newSingleThreadExecutor()
    private val main = Handler(Looper.getMainLooper())
    private val hawk = Class.forName("com.orhanobut.hawk.Hawk")
    private val get = hawk.getMethod("get", String::class.java, Any::class.java)
    private val put = hawk.getMethod("put", String::class.java, Any::class.java)
    private val ink = Color.rgb(237, 243, 250)
    private val muted = Color.rgb(149, 169, 194)
    private val blue = Color.rgb(133, 186, 255)
    private fun stored(key: String) = get.invoke(null, key, "")?.toString() ?: ""
    private fun dp(c: Context, n: Int) = (n * c.resources.displayMetrics.density).toInt()
    private fun shape(c: Context, color: Int, stroke: Int = Color.TRANSPARENT) =
        GradientDrawable().apply { setColor(color); cornerRadius = dp(c, 14).toFloat(); setStroke(dp(c, 1), stroke) }
    internal fun text(c: Context, value: String, size: Float = 14f, color: Int = muted) =
        TextView(c).apply { this.text = value; textSize = size; setTextColor(color); setPadding(0, dp(c, 6), 0, dp(c, 6)) }
    internal fun column(c: Context) = LinearLayout(c).apply {
        orientation = LinearLayout.VERTICAL
        setPadding(dp(c, 24), dp(c, 20), dp(c, 24), dp(c, 20))
        background = shape(c, Color.rgb(20, 30, 45))
    }
    private fun field(c: Context, box: LinearLayout, label: String, hint: String, password: Boolean = false): EditText {
        box.addView(text(c, label))
        return EditText(c).apply {
            this.hint = hint; textSize = 15f; setTextColor(ink); setHintTextColor(muted)
            inputType = if (password) InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD
                else InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS
            setSingleLine(true); setPadding(dp(c, 14), dp(c, 10), dp(c, 14), dp(c, 10))
            if (password) transformationMethod = android.text.method.PasswordTransformationMethod.getInstance()
            background = shape(c, Color.rgb(11, 20, 33), Color.rgb(43, 61, 84))
            onFocusChangeListener = View.OnFocusChangeListener { _, focused ->
                background = shape(c, Color.rgb(11, 20, 33), if (focused) blue else Color.rgb(43, 61, 84))
            }
            box.addView(this, LinearLayout.LayoutParams(-1, dp(c, 48)))
        }
    }
    internal fun button(c: Context, box: LinearLayout, label: String, primary: Boolean = false, action: () -> Unit): Button =
        Button(c).apply {
            text = label; isAllCaps = false; textSize = 14f; setTextColor(if (primary) Color.rgb(11, 20, 33) else ink)
            background = shape(c, if (primary) blue else Color.rgb(31, 46, 65))
            onFocusChangeListener = View.OnFocusChangeListener { _, focused ->
                background = shape(c, if (primary) blue else Color.rgb(31, 46, 65), if (focused) ink else Color.TRANSPARENT)
            }
            setOnClickListener { action() }
            box.addView(this, LinearLayout.LayoutParams(-1, dp(c, 46)).apply { topMargin = dp(c, 12) })
        }
    internal fun dialog(c: Context, box: LinearLayout): AlertDialog {
        val scroll = ScrollView(c).apply { isFillViewport = true; addView(box) }
        return AlertDialog.Builder(c).setView(scroll).create().apply {
            show()
            window?.setBackgroundDrawableResource(android.R.color.transparent)
            val width = minOf(dp(c, 520), c.resources.displayMetrics.widthPixels - dp(c, 32))
            window?.setLayout(width, minOf(dp(c, 680), c.resources.displayMetrics.heightPixels - dp(c, 48)))
            window?.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE)
        }
    }
    private fun deviceId(): String {
        var value = stored("sync_device_session_id")
        if (value.isEmpty()) { value = UUID.randomUUID().toString(); put.invoke(null, "sync_device_session_id", value) }
        return value
    }
    @JvmStatic fun normalizeEndpoint(value: String): String {
        val raw = value.trim().trimEnd('/')
        val local = raw.substringBefore(':').let { !it.contains('.') || it.endsWith(".lan") || it.endsWith(".local") || it.matches(Regex("[0-9.]+")) }
        val uri = URI(if (raw.contains("://")) raw else if (local) "http://$raw" else
            "https://$raw")
        require(uri.userInfo == null && uri.query == null && uri.fragment == null && uri.host != null &&
            (uri.path.isNullOrEmpty() || uri.path == "/") && uri.port != 0 && uri.port <= 65535) { "请输入完整服务地址，不包含账号或路径" }
        val host = uri.host.lowercase()
        val parts = host.split('.').mapNotNull { it.toIntOrNull() }
        val privateIp = parts.size == 4 && parts.all { it in 0..255 } &&
            (parts[0] == 10 || (parts[0] == 192 && parts[1] == 168) ||
                (parts[0] == 172 && parts[1] in 16..31) || parts[0] == 127)
        val localName = (!host.contains('.') && !host.contains(':')) || host.endsWith(".lan") || host.endsWith(".local")
        require(uri.scheme == "https" || (uri.scheme == "http" && (privateIp || localName))) {
            "公网连接请使用 HTTPS；局域网地址可以使用 HTTP"
        }
        return if (uri.scheme == "http" && uri.port == -1)
            URI("http", null, uri.host, 8080, null, null, null).toString()
            else uri.toString().trimEnd('/')
    }
    private fun request(base: String, path: String, method: String = "GET", data: JSONObject? = null, token: String = ""): JSONObject {
        // Only reads may be replayed: mail, registration and deletion must never run twice.
        try { return requestOnce(base, path, method, data, token) } catch (e: IOException) {
            if (method != "GET" || e is javax.net.ssl.SSLException) throw e
            Thread.sleep(350)
            return requestOnce(base, path, method, data, token)
        }
    }
    private fun requestOnce(base: String, path: String, method: String, data: JSONObject?, token: String): JSONObject {
        val uri = URI(normalizeEndpoint(base))
        // Resolve LAN names on the worker, then pin HTTP to a private address. No public plaintext credentials.
        val destination = if (uri.scheme == "http") {
            val addresses = InetAddress.getAllByName(uri.host)
            require(addresses.isNotEmpty() && addresses.all { it.isSiteLocalAddress || it.isLoopbackAddress || it.isLinkLocalAddress }) {
                "该 HTTP 地址没有解析到局域网；外网请使用 HTTPS 地址"
            }
            val address = addresses.firstOrNull { it is java.net.Inet4Address } ?: addresses.first()
            URI("http", null, address.hostAddress, uri.port, null, null, null).toString()
        } else uri.toString()
        val conn = URL(destination + path).openConnection() as HttpURLConnection
        conn.connectTimeout = 12000; conn.readTimeout = 30000; conn.requestMethod = method
        conn.instanceFollowRedirects = false
        conn.useCaches = false
        conn.setRequestProperty("Connection", "close")
        conn.setRequestProperty("Accept", "application/json")
        if (uri.scheme == "http") conn.setRequestProperty("Host", uri.rawAuthority)
        if (token.isNotEmpty()) conn.setRequestProperty("Authorization", "Bearer $token")
        try {
            if (data != null) {
                conn.doOutput = true
                conn.setRequestProperty("Content-Type", "application/json; charset=utf-8")
                val payload = data.toString().toByteArray(Charsets.UTF_8)
                conn.setFixedLengthStreamingMode(payload.size)
                conn.outputStream.use { it.write(payload) }
            }
            val status = conn.responseCode
            val stream = if (status in 200..299) conn.inputStream else conn.errorStream
            val content = stream?.bufferedReader(Charsets.UTF_8)?.use { it.readText() } ?: ""
            val result = try { JSONObject(content) } catch (_: Exception) { JSONObject() }
            if (status !in 200..299) {
                val detail = result.opt("detail")
                throw IllegalStateException(if (detail is String) detail else when (status) {
                    404 -> "服务端需要更新，才能使用邮箱和设备管理"
                    422 -> "请检查账号、邮箱、密码和验证码格式"
                    429 -> "请求过于频繁，请稍后再试"
                    401 -> "登录已失效，请重新登录"
                    else -> "服务请求失败（HTTP $status）"
                })
            }
            return result
        } finally { conn.disconnect() }
    }
    private fun task(status: TextView, controls: List<View>, job: () -> JSONObject, done: (JSONObject) -> Unit) {
        if (controls.any { !it.isEnabled }) return
        controls.forEach { it.isEnabled = false }; status.text = "正在处理…"
        worker.execute {
            try {
                val result = job()
                main.post { controls.forEach { it.isEnabled = true }; status.text = ""; done(result) }
            } catch (e: Exception) {
                main.post { controls.forEach { it.isEnabled = true }; status.text = when (e) {
                    is javax.net.ssl.SSLHandshakeException -> "安全连接验证失败，请检查手机时间和服务地址"
                    is java.net.SocketTimeoutException -> "连接超时，请稍后重试"
                    is IOException -> "网络连接中断，请稍后重试（${e.javaClass.simpleName}）"
                    else -> e.message ?: "连接失败，请检查服务地址和网络"
                } }
            }
        }
    }
    private fun activate(name: String, base: String, token: String) {
        val type = Class.forName("com.github.tvbox.osc.sync.SyncServerProfile")
        val profile = type.getConstructor(String::class.java, String::class.java, String::class.java).newInstance(name, base, token)
        type.getMethod("activate", type).invoke(null, profile)
        Class.forName("com.github.tvbox.osc.sync.TvboxSyncClient").getMethod("pull").invoke(null)
        for (name in listOf("FavoritesSync", "SearchHistorySync")) {
            val sync = Class.forName("com.github.tvbox.osc.sync." + name)
            sync.getMethod("sync", Class.forName("com.github.tvbox.osc.sync." + name + "\$Callback")).invoke(null, null)
        }
        Class.forName("com.github.tvbox.osc.sync.AccountSettingsSync").getMethod("afterLogin").invoke(null)
        val bus = Class.forName("org.greenrobot.eventbus.EventBus")
        val event = Class.forName("com.github.tvbox.osc.event.IntegrationStatusEvent").getConstructor().newInstance()
        bus.getMethod("post", Any::class.java).invoke(bus.getMethod("getDefault").invoke(null), event)
    }
    private fun clearSession() {
        val name = stored("sync_account_name"); val endpoint = stored("sync_endpoint")
        val profiles = try { org.json.JSONArray(stored("sync_server_profiles")) } catch (_: Exception) { org.json.JSONArray() }
        val kept = org.json.JSONArray()
        for (i in 0 until profiles.length()) {
            val p = profiles.optJSONObject(i) ?: continue
            if (p.optString("name") != name || p.optString("endpoint").trimEnd('/') != endpoint.trimEnd('/')) kept.put(p)
        }
        put.invoke(null, "sync_server_profiles", kept.toString())
        put.invoke(null, "sync_token", "")
        put.invoke(null, "sync_account_name", "")
        // Keep the cache's owner scope, so a later login cannot claim another account's local history.
        put.invoke(null, "sync_active_scope_v2", "")
        try {
            val bus = Class.forName("org.greenrobot.eventbus.EventBus")
            val event = Class.forName("com.github.tvbox.osc.event.RefreshEvent").getConstructor(Int::class.javaPrimitiveType).newInstance(1)
            bus.getMethod("post", Any::class.java).invoke(bus.getMethod("getDefault").invoke(null), event)
            val status = Class.forName("com.github.tvbox.osc.event.IntegrationStatusEvent").getConstructor().newInstance()
            bus.getMethod("post", Any::class.java).invoke(bus.getMethod("getDefault").invoke(null), status)
        } catch (_: Exception) { }
    }
    @JvmStatic fun show(c: Context) {
        val box = column(c)
        box.addView(text(c, "CONTINUEBOX · 续映", 13f, blue))
        box.addView(text(c, "接续你的每一次观看", 25f, ink).apply { typeface = Typeface.DEFAULT_BOLD })
        box.addView(text(c, "连接你自己的服务器，同步历史、收藏与播放进度。"))
        val endpoint = field(c, box, "服务地址", "https://sync.example.com").apply { setText(stored("sync_endpoint")) }
        val account = field(c, box, "账号 / 邮箱", "原有账号也可以继续登录")
        val password = field(c, box, "密码", "输入账号密码", true)
        val status = text(c, "", 13f, Color.rgb(255, 210, 148)); box.addView(status)
        val dialog = dialog(c, box)
        val controls = mutableListOf<View>(endpoint, account, password)
        controls.add(button(c, box, "登录并同步", true) {
            val address = endpoint.text.toString()
            val name = account.text.toString().trim()
            val pass = password.text.toString()
            task(status, controls, {
                val base = normalizeEndpoint(address)
                request(base, "/api/v1/auth/login", "POST", JSONObject().put("username", name)
                    .put("password", pass).put("device_id", deviceId()).put("device_name", Build.MODEL))
                    .put("_base", base)
            }) { result ->
                activate(result.optString("username", account.text.toString().trim()), result.getString("_base"), result.getString("token"))
                password.text.clear(); dialog.dismiss(); Toast.makeText(c, "登录成功，正在接续观看记录", Toast.LENGTH_SHORT).show()
            }
        })
        button(c, box, "邮箱注册") {
            try { register(c, normalizeEndpoint(endpoint.text.toString()), dialog) } catch(e: Exception) { status.text = e.message }
        }
        if (stored("sync_token").isNotEmpty()) {
            box.addView(text(c, "当前账号：" + stored("sync_account_name"), 14f, ink))
            box.addView(text(c, "服务器：" + stored("sync_endpoint"), 12f))
            button(c, box, "管理账号") { dialog.dismiss(); showAccounts(c) }
            // Keep account operations together; the login form only opens management.
        }
        button(c, box, "稍后再说") { dialog.dismiss() }
    }
    private fun accountDetails(c: Context, base: String, token: String, signedOut: () -> Unit) {
        val box = column(c); box.addView(text(c, stored("sync_account_name"), 25f, ink))
        box.addView(text(c, "当前账号", 13f, blue))
        box.addView(text(c, "服务器：$base", 13f))
        val status = text(c, "", 13f, Color.rgb(255,210,148)); box.addView(status)
        val owner = dialog(c, box)
        fun finish() { owner.dismiss(); signedOut() }
        button(c, box, "查看登录设备") { devices(c, base, token) { finish() } }
        button(c, box, "邮箱与安全") { accountSecurity(c, base, token) { finish() } }
        button(c, box, "退出当前账号") { logoutCurrent(c, owner) { signedOut() } }
        button(c, box, "返回账号列表") { owner.dismiss() }
    }
    private fun accountSecurity(c: Context, base: String, token: String, signedOut: () -> Unit) {
        val box = column(c); box.addView(text(c, "邮箱与安全", 25f, ink))
        box.addView(text(c, "账号：" + stored("sync_account_name"), 15f, ink))
        box.addView(text(c, "服务器：$base", 12f))
        val email = text(c, "正在读取邮箱…"); box.addView(email)
        val status = text(c, "", 13f, Color.rgb(255,210,148)); box.addView(status)
        val owner = dialog(c, box)
        button(c, box, "绑定邮箱") { bind(c, base, token) {
            task(status, listOf(), { request(base, "/api/v1/account/profile", token=token) }) {
                email.text = "已验证邮箱：" + it.optString("email")
            }
        } }
        button(c, box, "注销账号") {
                try { removeAccount(c, base, token) { owner.dismiss(); signedOut() } }
                catch(e: Exception) { status.text = e.message }
        }
        button(c, box, "返回账号管理") { owner.dismiss() }
        task(status, listOf(), { request(base, "/api/v1/account/profile", token=token) }) {
            email.text = if (it.optBoolean("email_verified")) "已验证邮箱：" + it.optString("email") else "尚未绑定验证邮箱"
        }
    }
    private fun register(c: Context, base: String, parent: AlertDialog) {
        val box = column(c)
        box.addView(text(c, "创建续映账号", 25f, ink))
        box.addView(text(c, "验证邮箱后，即可在你的设备间接续观看。"))
        val username = field(c, box, "账号名", "3～32 位字母、数字、下划线")
        val email = field(c, box, "邮箱", "name@example.com").apply { inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_EMAIL_ADDRESS }
        val password = field(c, box, "密码", "至少 12 位，建议使用独立密码", true)
        val code = field(c, box, "邮箱验证码", "6 位验证码，10 分钟有效").apply { inputType = InputType.TYPE_CLASS_NUMBER }
        val status = text(c, "", 13f, Color.rgb(255, 210, 148)); box.addView(status)
        val dialog = dialog(c, box); val controls = mutableListOf<View>(username,email,password,code)
        val send = button(c, box, "发送验证码") {
            val address = email.text.toString().trim()
            task(status, controls, { request(base, "/api/v1/auth/email-code", "POST", JSONObject().put("email",address)) }) {
                status.text = "验证码已发送，请查看收件箱或垃圾邮件。60 秒后可重新发送。"
            }
        }; controls.add(send)
        controls.add(button(c, box, "验证并注册", true) {
            val name=username.text.toString().trim(); val address=email.text.toString().trim()
            val pass=password.text.toString(); val verification=code.text.toString().trim()
            task(status, controls, {
                require(pass.length >= 12) { "密码至少需要 12 位" }
                request(base,"/api/v1/auth/register","POST",JSONObject().put("username",name)
                    .put("email",address).put("password",pass).put("code",verification)
                    .put("device_id",deviceId()).put("device_name",Build.MODEL))
            }) { result -> activate(result.getString("username"),base,result.getString("token"));password.text.clear();dialog.dismiss();parent.dismiss() }
        })
        button(c,box,"返回登录") { dialog.dismiss() }
    }
    @JvmStatic fun showAccounts(c: Context) {
        val box = column(c); box.addView(text(c, "管理账号", 25f, ink))
        val name = stored("sync_account_name"); val token = stored("sync_token")
        box.addView(text(c, "每个账号独立保存对应服务器的登录。"))
        val status = text(c, "", 13f, Color.rgb(255,210,148)); box.addView(status)
        val dialog = dialog(c, box)
        if (token.isNotEmpty()) {
            val base = stored("sync_endpoint")
            button(c, box, "当前账号：$name\n服务器：$base\n管理此账号") {
                try { accountDetails(c, base, token) { dialog.dismiss() } }
                catch(e: Exception) { status.text = e.message }
            }.apply { gravity = Gravity.START or Gravity.CENTER_VERTICAL; setPadding(dp(c,16),0,dp(c,16),0); layoutParams.height=dp(c,104) }
        } else {
            box.addView(text(c, "当前未登录", 15f, ink))
        }
        val profiles = try { org.json.JSONArray(stored("sync_server_profiles")) } catch (_: Exception) { org.json.JSONArray() }
        for (i in 0 until profiles.length()) {
            val p = profiles.optJSONObject(i) ?: continue
            val account = p.optString("name"); val endpoint = p.optString("endpoint"); val session = p.optString("token")
            if (session.isEmpty() || (account == name && endpoint.trimEnd('/') == stored("sync_endpoint").trimEnd('/') && token.isNotEmpty())) continue
            val control = button(c, box, "已保存：$account\n服务器：$endpoint\n管理此登录") { }.apply {
                gravity=Gravity.START or Gravity.CENTER_VERTICAL; setPadding(dp(c,16),0,dp(c,16),0); layoutParams.height=dp(c,104)
            }
            control.setOnClickListener {
                savedLogin(c, account, endpoint, session) { dialog.dismiss(); showAccounts(c) }
            }
        }
        button(c, box, "登录其他账号", true) { dialog.dismiss(); show(c) }
        button(c, box, "关闭") { dialog.dismiss() }
    }
    @JvmStatic fun forgetSavedLogin(name: String, endpoint: String, token: String): Boolean {
        val current = stored("sync_account_name") == name && stored("sync_endpoint").trimEnd('/').equals(endpoint.trimEnd('/'),true) && stored("sync_token") == token
        if (current) { clearSession(); return true }
        val profiles = try { org.json.JSONArray(stored("sync_server_profiles")) } catch (_: Exception) { org.json.JSONArray() }
        val kept=org.json.JSONArray()
        for(i in 0 until profiles.length()) {
            val p=profiles.optJSONObject(i) ?: continue
            if (!(p.optString("name")==name && p.optString("endpoint").trimEnd('/').equals(endpoint.trimEnd('/'),true) && p.optString("token")==token)) kept.put(p)
        }
        put.invoke(null,"sync_server_profiles",kept.toString())
        return false
    }
    private fun savedLogin(c: Context, name: String, base: String, token: String, changed: () -> Unit) {
        val box=column(c);box.addView(text(c,name,25f,ink));box.addView(text(c,"已保存的登录\n服务器：$base"))
        box.addView(text(c,"同一账号可以通过不同地址连接。同一服务的旧地址失效时，移除此登录记录即可，服务器中的账号和数据保留。",12f))
        val status=text(c,"",13f,Color.rgb(255,210,148));box.addView(status);val owner=dialog(c,box)
        val switch=button(c,box,"切换到此登录",true) {}
        switch.setOnClickListener {
            task(status,listOf(switch),{request(base,"/api/v1/account/profile",token=token)}) {
                activate(it.getString("username"),normalizeEndpoint(base),token);owner.dismiss();changed()
            }
        }
        button(c,box,"移除此登录记录") {
            AlertDialog.Builder(c).setTitle("移除本机保存的登录？").setMessage("只移除这个地址的本机登录记录，不注销账号，不删除同步数据，也不影响其他地址或设备的登录。")
                .setNegativeButton("保留",null).setPositiveButton("确认移除") { _,_ ->
                    forgetSavedLogin(name,base,token);owner.dismiss();changed()
                    Toast.makeText(c,"旧登录记录已移除",Toast.LENGTH_SHORT).show()
                }.show()
        }
        button(c,box,"返回账号列表") { owner.dismiss() }
    }
    private fun logoutCurrent(c: Context, owner: AlertDialog, signedOut: () -> Unit = {}) {
        val base = stored("sync_endpoint"); val token = stored("sync_token")
        clearSession(); owner.dismiss(); signedOut()
        Toast.makeText(c, "已退出当前账号，账号和同步数据保留", Toast.LENGTH_LONG).show()
        worker.execute {
            try { request(normalizeEndpoint(base), "/api/v1/account/logout", "POST", JSONObject(), token) }
            catch (_: Exception) {
                main.post { Toast.makeText(c, "本机已退出；服务器尚未确认，可在其他设备解除此次登录", Toast.LENGTH_LONG).show() }
            }
        }
    }
    private fun devices(c: Context, base: String, token: String, signedOut: () -> Unit) {
        val box = column(c);box.addView(text(c,"登录设备",25f,ink))
        box.addView(text(c,"账号："+stored("sync_account_name")+"\n服务器：$base",12f))
        box.addView(text(c,"解除设备登录会保留账号和同步数据。"))
        val status=text(c,"",13f,Color.rgb(255,210,148));box.addView(status)
        val list=LinearLayout(c).apply { orientation=LinearLayout.VERTICAL };box.addView(list)
        val dialog=dialog(c,box)
        fun refresh() {
            task(status,listOf(),{ request(base,"/api/v1/account/devices",token=token) }) { result ->
                list.removeAllViews()
                val devices=result.getJSONArray("devices")
                for(i in 0 until devices.length()) {
                    val d=devices.getJSONObject(i)
                    val seen=java.text.SimpleDateFormat("MM-dd HH:mm",java.util.Locale.CHINA).format(java.util.Date(d.getLong("last_seen")*1000))
                    val label=d.getString("name")+(if(d.optBoolean("current"))" · 当前设备" else "")+"\n最近活动 "+seen
                    val action=button(c,list,label) {
                        AlertDialog.Builder(c).setTitle("解除设备登录").setMessage("解除这台设备的登录？账号与历史会保留。")
                            .setNegativeButton("取消",null).setPositiveButton("解除登录") { _,_ ->
                                task(status,listOf(),{request(base,"/api/v1/account/devices/"+d.getString("id"),"DELETE",token=token)}) {
                                    if(d.optBoolean("current")){clearSession();dialog.dismiss();signedOut()}else refresh()
                                }
                            }.show()
                    };action.gravity=Gravity.START or Gravity.CENTER_VERTICAL
                    action.layoutParams.height=dp(c,68)
                }
                if(result.optBoolean("legacy_sessions_possible"))list.addView(text(c,"旧版本登录无法逐台识别。如需清除，请选择退出所有设备，再重新登录。"))
            }
        }
        button(c,box,"退出所有设备") {
            AlertDialog.Builder(c).setTitle("退出所有设备").setMessage("所有设备都需要重新登录，账号与数据会保留。")
                .setNegativeButton("取消",null).setPositiveButton("确认退出"){_,_->
                    task(status,listOf(),{request(base,"/api/v1/account/logout-all","POST",JSONObject(),token)}){clearSession();dialog.dismiss();signedOut()}
                }.show()
        }
        button(c,box,"刷新设备列表") { refresh() }
        button(c,box,"关闭") { dialog.dismiss() }
        refresh()
    }
    private fun removeAccount(c: Context, base: String, token: String, removed: () -> Unit) {
        val box = column(c); box.addView(text(c, "注销账号", 25f, ink))
        box.addView(text(c, "注销将永久删除此账号、观看记录、收藏和设置，并解除所有设备登录。仅退出本机，请返回管理账号选择“退出当前账号”。"))
        val account = field(c, box, "确认账号名", "输入当前账号名确认")
        val password = field(c, box, "当前密码", "用于确认本人操作", true)
        val code = field(c, box, "邮箱验证码", "发送到已绑定的邮箱").apply { inputType = InputType.TYPE_CLASS_NUMBER }
        val status = text(c, "", 13f, Color.rgb(255,210,148)); box.addView(status)
        val dialog = dialog(c, box); val controls = mutableListOf<View>(account,password,code)
        controls.add(button(c,box,"发送注销验证码") {
            task(status,controls,{
                val profile = request(base,"/api/v1/account/profile",token=token)
                require(profile.optBoolean("email_verified")) { "请先在管理账号中绑定并验证邮箱" }
                request(base,"/api/v1/auth/email-code","POST",JSONObject().put("email",profile.getString("email")).put("purpose","delete"),token)
            }) { status.text = "注销验证码已发送，请查看已绑定邮箱" }
        })
        controls.add(button(c,box,"永久注销账号") {
            val name=account.text.toString().trim(); val pass=password.text.toString(); val verification=code.text.toString().trim()
            AlertDialog.Builder(c).setTitle("确认永久注销？").setMessage("此操作无法恢复。确认删除账号 $name 及其全部同步数据？")
                .setNegativeButton("保留账号",null).setPositiveButton("确认注销") { _,_ ->
                    task(status,controls,{ request(base,"/api/v1/account","DELETE",JSONObject().put("confirmation",name).put("password",pass).put("code",verification),token) }) {
                        clearSession(); password.text.clear(); dialog.dismiss(); removed()
                        Toast.makeText(c,"账号已注销",Toast.LENGTH_LONG).show()
                    }
                }.show()
        })
        button(c,box,"返回") { dialog.dismiss() }
    }
    private fun bind(c: Context,base: String,token: String, bound: () -> Unit = {}) {
        val box=column(c);box.addView(text(c,"绑定验证邮箱",25f,ink));box.addView(text(c,"原账号和观看数据会完整保留。"))
        val email=field(c,box,"邮箱","name@example.com")
        val password=field(c,box,"当前账号密码","用于确认本人操作",true)
        val code=field(c,box,"邮箱验证码","6 位验证码")
        val status=text(c,"",13f,Color.rgb(255,210,148));box.addView(status);val dialog=dialog(c,box)
        val controls=mutableListOf<View>(email,password,code)
        controls.add(button(c,box,"发送验证码"){
            val address=email.text.toString().trim()
            task(status,controls,{request(base,"/api/v1/auth/email-code","POST",JSONObject().put("email",address).put("purpose","bind"),token)}){status.text="验证码已发送"}
        })
        controls.add(button(c,box,"验证并绑定",true){
            val address=email.text.toString().trim();val verification=code.text.toString().trim();val pass=password.text.toString()
            task(status,controls,{request(base,"/api/v1/account/email","POST",JSONObject().put("email",address).put("code",verification).put("password",pass),token)}){
                password.text.clear();dialog.dismiss();bound();Toast.makeText(c,"邮箱已绑定",Toast.LENGTH_SHORT).show()
            }
        });button(c,box,"取消"){dialog.dismiss()}
    }
}
