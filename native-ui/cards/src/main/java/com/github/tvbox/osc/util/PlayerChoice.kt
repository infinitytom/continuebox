package com.github.tvbox.osc.util

import android.app.Activity
import android.app.AlertDialog
import android.graphics.Color
import android.widget.CheckBox
import android.widget.Toast
import org.json.JSONObject

/** Explicit settings win over source defaults and old per-film snapshots. */
object PlayerChoice {
    private val hawk = Class.forName("com.orhanobut.hawk.Hawk")
    private val get = hawk.getMethod("get", String::class.java, Any::class.java)
    private val put = hawk.getMethod("put", String::class.java, Any::class.java)
    private val helper = Class.forName("com.github.tvbox.osc.util.PlayerHelper")

    @JvmStatic
    fun configuredType(): Int {
        val explicit = get.invoke(null, "player_choice_user_v1", false) == true ||
            (get.invoke(null, "play_type_version", 0) as Number).toInt() > 0
        return if (explicit) (get.invoke(null, "play_type", -1) as Number).toInt() else -1
    }

    @JvmStatic
    fun markExplicit() { put.invoke(null, "player_choice_user_v1", true) }

    @JvmStatic
    fun applyConfigured(config: JSONObject) {
        val type = configuredType()
        if (type >= 0) {
            config.put("pl", type)
            config.put("plv", get.invoke(null, "play_type_version", 0))
        }
    }

    @JvmStatic
    fun begin(fragment: Any) {
        val activity = fragment.javaClass.getMethod("requireActivity").invoke(fragment) as Activity
        if (activity.isFinishing || activity.isDestroyed) return
        helper.getDeclaredField("mPlayersExistInfo").apply { isAccessible = true }.set(null, null)
        @Suppress("UNCHECKED_CAST")
        val types = (helper.getMethod("getExistPlayerTypes").invoke(null) as List<Int>).sorted()
        val selected = configuredType()
        if (selected >= 0 && selected in types) {
            resume(fragment, selected)
            return
        }
        val remember = CheckBox(activity).apply {
            text = "记住选择，作为设置中的默认播放器"
            setTextColor(Color.rgb(202, 196, 208))
            isChecked = false
            setPadding(24, 12, 24, 12)
        }
        val labels = types.map { helper.getMethod("getPlayerName", Int::class.javaPrimitiveType).invoke(null, it).toString() }
        val dialog = AlertDialog.Builder(activity)
            .setTitle(if (selected >= 0) "原选择不可用，请选择播放器" else "选择本次播放器")
            .setItems(labels.toTypedArray()) { _, index ->
                val chosen = types[index]
                if (remember.isChecked) {
                    put.invoke(null, "play_type", chosen)
                    put.invoke(null, "play_type_version", (get.invoke(null, "play_type_version", 0) as Number).toInt() + 1)
                    markExplicit()
                }
                if (!activity.isFinishing && !activity.isDestroyed) resume(fragment, chosen)
            }
            .setView(remember)
            .setNegativeButton("取消", null)
            .create()
        dialog.show()
    }

    private fun resume(fragment: Any, type: Int) {
        try {
            val cls = fragment.javaClass
            cls.getDeclaredMethod("initPlayerCfg").apply { isAccessible = true }.invoke(fragment)
            val config = cls.getDeclaredField("mVodPlayerCfg").apply { isAccessible = true }.get(fragment) as JSONObject
            config.put("pl", type)
            val controller = cls.getDeclaredField("mController").apply { isAccessible = true }.get(fragment)
                ?: error("Player controller is unavailable")
            controller.javaClass.getMethod("setPlayerConfig", JSONObject::class.java).invoke(controller, config)
            cls.getDeclaredField("triedLineFlags").apply { isAccessible = true }.get(fragment).let { (it as MutableSet<*>).clear() }
            cls.getMethod("play", Boolean::class.javaPrimitiveType).invoke(fragment, false)
        } catch (error: Throwable) {
            val activity = fragment.javaClass.getMethod("requireActivity").invoke(fragment) as Activity
            Toast.makeText(activity, "播放器启动失败，请重新选择", Toast.LENGTH_LONG).show()
            android.util.Log.e("ContinueBox", "Selected player could not start", error)
        }
    }
}
