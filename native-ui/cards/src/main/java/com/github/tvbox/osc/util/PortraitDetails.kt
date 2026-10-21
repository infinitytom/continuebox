package com.github.tvbox.osc.util

import android.app.Activity
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import kotlin.math.roundToInt

/** Compact phone layout; dimensions follow window width, not mutable AutoSize density. */
object PortraitDetails {
    @JvmStatic
    fun apply(activity: Activity) {
        fun view(name: String): View? = activity.findViewById(
            activity.resources.getIdentifier(name, "id", activity.packageName))
        val top = view("topLayout") as? LinearLayout ?: return
        val lower = view("detailLowerContent") as? LinearLayout ?: return
        val thumb = view("thumbContainer") ?: return
        val title = view("tvName") as? TextView ?: return
        val info = title.parent as? LinearLayout ?: return
        val play = view("tvPlay") as? TextView ?: return
        val actions = play.parent as? LinearLayout ?: return
        val buttons = arrayOf("tvPlay", "tvCollect", "tvQuickSearch", "tvDesc", "tvReviews")
            .associateWith { view(it) as? TextView }
        val unit = activity.resources.displayMetrics.widthPixels / 390f
        fun px(value: Int) = (value * unit).roundToInt()
        (top.parent as? ViewGroup)?.removeView(top)
        lower.addView(top, 0, LinearLayout.LayoutParams(-1, -2))
        top.orientation = LinearLayout.VERTICAL
        top.setPadding(px(16), px(12), px(16), px(16))
        (actions.parent as? ViewGroup)?.removeView(actions)
        (thumb.parent as? ViewGroup)?.removeView(thumb)
        (info.parent as? ViewGroup)?.removeView(info)
        val hero = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
        top.addView(hero, 0, LinearLayout.LayoutParams(-1, -2))
        hero.addView(thumb, LinearLayout.LayoutParams(px(108), px(154)))
        hero.addView(info, LinearLayout.LayoutParams(0, px(184), 1f).apply { leftMargin = px(12) })
        info.setPadding(px(10), px(8), px(10), px(8))
        (view("ivThumb") as? ImageView)?.layoutParams = FrameLayout.LayoutParams(-1, -1)
        title.setSingleLine(false)
        title.maxLines = 2
        title.setTextSize(0, px(20).toFloat())
        for (name in arrayOf("tvActor", "tvDirector", "tvDes", "tvSite", "tvYear", "tvArea", "tvLang", "tvPlayUrl")) {
            (view(name) as? TextView)?.apply { maxLines = 2; setTextSize(0, px(12).toFloat()) }
        }
        for (i in 0 until info.childCount) {
            (info.getChildAt(i) as? ScrollView)?.layoutParams = LinearLayout.LayoutParams(-1, 0, 1f)
        }
        actions.removeAllViews()
        actions.orientation = LinearLayout.VERTICAL
        top.addView(actions, LinearLayout.LayoutParams(-1, -2).apply { topMargin = px(14) })
        for (names in arrayOf(arrayOf("tvPlay", "tvCollect"), arrayOf("tvQuickSearch", "tvDesc", "tvReviews"))) {
            val row = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
            actions.addView(row, LinearLayout.LayoutParams(-1, -2).apply { bottomMargin = px(8) })
            for (name in names) {
                val button = buttons[name] ?: continue
                (button.parent as? ViewGroup)?.removeView(button)
                row.addView(button, LinearLayout.LayoutParams(0, px(44), 1f).apply { setMargins(px(3), 0, px(3), 0) })
                button.gravity = Gravity.CENTER
                button.setTextSize(0, px(14).toFloat())
                button.setTextColor(0xfff4f0f8.toInt())
            }
        }
        for ((name, height) in arrayOf("mGridView" to 220, "mPeopleView" to 180, "mRecommendView" to 210)) {
            view(name)?.let { it.layoutParams = it.layoutParams.apply { this.height = px(height) } }
        }
        view("episodeDetailScroll")?.visibility = View.GONE
        view("ivBackdrop")?.alpha = 0.12f
        top.requestLayout()
    }
}
