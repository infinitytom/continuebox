package com.github.tvbox.osc.util

import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.net.Uri
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.LinearLayout
import android.widget.TextView

/** Shows real device addresses and source login guidance, without reading cloud credentials. */
object CloudPortal {
    private val providers = linkedMapOf(
        "阿里云盘" to listOf("AliYun", "Ali", "AliDrive"),
        "夸克网盘" to listOf("Quark", "QuarkShare"),
        "UC 网盘" to listOf("UC", "UCShare"),
        "天翼云盘" to listOf("Tianyi"),
        "123 网盘" to listOf("Pan123"),
        "百度网盘" to listOf("Baidu"),
        "迅雷网盘" to listOf("Thunder"),
        "AList / WebDAV" to listOf("Alist", "AList", "WebDAVGuard")
    )
    @JvmStatic fun supportedNames(loaders: Collection<ClassLoader>): List<String> = providers.filterValues { aliases ->
        loaders.any { loader -> aliases.any { alias ->
            try { loader.loadClass("com.github.catvod.spider.$alias"); true }
            catch (_: ClassNotFoundException) { false } catch (_: LinkageError) { false }
        } }
    }.keys.toList()

    @JvmStatic fun show(c: Context, owner: Any) {
        val apiClass = Class.forName("com.github.tvbox.osc.api.ApiConfig")
        val api = apiClass.getMethod("get").invoke(null)
        val box = AccountPortal.column(c)
        box.addView(AccountPortal.text(c, "网盘管理", 25f, Color.rgb(237,243,250)))
        val source = try {
            val bean = apiClass.getMethod("getHomeSourceBean").invoke(api)
            bean.javaClass.getMethod("getName").invoke(bean)?.toString().orEmpty()
        } catch (_: Exception) { "尚未选择" }
        box.addView(AccountPortal.text(c, "当前数据源：" + source.ifBlank { "尚未选择" }))
        box.addView(AccountPortal.text(c, "网盘在哪里登录？", 17f, Color.rgb(237,243,250)))
        box.addView(AccountPortal.text(c, "在所选数据源的首页，找到“管理网盘”“网盘设置”或“登录网盘”，选择网盘后按提示扫码或填写登录信息。"))
        box.addView(AccountPortal.text(c, "本页用于找到配置入口。登录续映账号后，仍需在数据源中单独登录网盘。"))
        val names = try {
            val jar = apiClass.getDeclaredField("jarLoader").apply { isAccessible=true }.get(api)
            val loaded = jar.javaClass.getDeclaredField("loaders").apply { isAccessible=true }.get(jar) as Map<*, *>
            supportedNames(loaded.values.filterIsInstance<ClassLoader>())
        } catch (_: Exception) { emptyList() }
        box.addView(AccountPortal.text(c, if (names.isEmpty())
            "支持的网盘以当前数据源的登录菜单为准；尚未识别到已加载的网盘扩展。"
            else "当前扩展已识别：" + names.joinToString("、")))
        val status = AccountPortal.text(c, "", 13f, Color.rgb(255,210,148)); box.addView(status)
        val dialog = AccountPortal.dialog(c, box)
        val managerClass = Class.forName("com.github.tvbox.osc.server.ControlManager")
        val manager = managerClass.getMethod("get").invoke(null)
        val local = try { managerClass.getMethod("getAddress", Boolean::class.javaPrimitiveType).invoke(manager, true)?.toString().orEmpty() } catch (_: Exception) { "" }
        val lan = try { managerClass.getMethod("getAddress", Boolean::class.javaPrimitiveType).invoke(manager, false)?.toString().orEmpty() } catch (_: Exception) { "" }
        box.addView(AccountPortal.text(c, "本机配置地址：" + lan.ifBlank { "当前没有局域网地址" }, 13f))
        box.addView(AccountPortal.text(c, "同一 Wi-Fi 下，可在手机浏览器输入上面的地址设置接口；网盘登录仍按数据源中的网盘菜单完成。", 12f))
        AccountPortal.button(c, box, "打开本机配置网页", true) {
            if (local.isBlank()) status.text="本机配置服务尚未启动，请重开应用"
            else openLocal(c, local)
        }
        AccountPortal.button(c, box, "接口与数据源设置") {
            c.startActivity(Intent().setClassName(c.packageName,"com.github.tvbox.osc.ui.activity.SettingActivity"))
            dialog.dismiss()
        }
        AccountPortal.button(c, box, "查看扩展状态") {
            val detail=AccountPortal.column(c)
            detail.addView(AccountPortal.text(c,"网盘扩展状态",22f,Color.rgb(237,243,250)))
            detail.addView(AccountPortal.text(c,apiClass.getMethod("getJarRuntimeDetails").invoke(api).toString()))
            val child=AccountPortal.dialog(c,detail)
            AccountPortal.button(c,detail,"重新加载扩展") {
                try {
                    owner.javaClass.getDeclaredMethod("lambda\$showCloudDiagnostics\$13\$com-github-tvbox-osc-ui-fragment-UserFragment",android.content.DialogInterface::class.java,Int::class.javaPrimitiveType)
                        .apply { isAccessible=true }.invoke(owner,null,0)
                    child.dismiss()
                } catch (_: Exception) { status.text="请在接口与数据源设置中重新加载配置" }
            }
            AccountPortal.button(c,detail,"返回") { child.dismiss() }
        }
        AccountPortal.button(c, box, "返回主页") { dialog.dismiss() }
    }
    private fun openLocal(c: Context, address: String) {
        val uri=Uri.parse(address)
        require(uri.scheme=="http" && uri.host=="127.0.0.1")
        val web=WebView(c).apply {
            settings.javaScriptEnabled=true
            settings.allowFileAccess=false
            settings.allowContentAccess=false
            isFocusable=true; isFocusableInTouchMode=true
            webViewClient=WebViewClient()
        }
        val dialog=AlertDialog.Builder(c).setTitle("本机配置网页").setView(web)
            .setNegativeButton("返回网盘管理",null).create()
        dialog.setOnDismissListener { web.stopLoading(); web.destroy() }
        dialog.show(); dialog.window?.setLayout((c.resources.displayMetrics.widthPixels*.94).toInt(),(c.resources.displayMetrics.heightPixels*.86).toInt())
        web.loadUrl(address)
    }
}
