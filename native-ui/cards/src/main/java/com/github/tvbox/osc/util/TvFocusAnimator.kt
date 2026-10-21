package com.github.tvbox.osc.util

import android.content.res.Resources
import android.view.View
import android.view.animation.DecelerateInterpolator

/**
 * Native TV focus: cover and label have separate transforms, like Izuko TV.
 * Static entry points keep the current player/navigation engine compatible.
 */
object TvFocusAnimator {
    private const val DURATION_MS = 160L
    private val interpolator = DecelerateInterpolator(1.35f)

    @JvmStatic
    fun animate(view: View?, focused: Boolean) = animate(view, focused, 1.025f)

    @JvmStatic
    fun animate(view: View?, focused: Boolean, focusedScale: Float) {
        if (view == null) return
        val cover = view.findViewWithTag<View>("cb_cover")
        val target = cover ?: view
        // Dense controls never grow across their neighbours. Card expansion
        // fits within the reserved item inset even if a legacy caller asks for more.
        val scale = if (cover != null) focusedScale.coerceIn(1f, 1.025f) else 1f
        view.stateListAnimator = null
        target.stateListAnimator = null
        target.animate().apply {
            cancel()
            scaleX(if (focused) scale else 1f)
            scaleY(if (focused) scale else 1f)
            translationZ(if (focused && cover != null) dp(3f) else 0f)
            alpha(1f)
            duration = if (focused) DURATION_MS else 120L
            setInterpolator(interpolator)
            start()
        }
        view.findViewWithTag<View>("cb_label")?.animate()?.apply {
            cancel()
            translationY(0f)
            alpha(1f)
            duration = DURATION_MS
            setInterpolator(interpolator)
            start()
        }
    }

    @JvmStatic
    fun listener(): View.OnFocusChangeListener = View.OnFocusChangeListener { view, focused ->
        animate(view, focused)
    }

    private fun dp(value: Float): Float = value * Resources.getSystem().displayMetrics.density
}
