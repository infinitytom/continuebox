package com.github.tvbox.osc.ui.tv.widget

import android.content.Context
import android.util.AttributeSet
import android.widget.FrameLayout

/** Native outline clipping covers images, badges and deletion overlays. */
class NativeCardFrame @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0,
) : FrameLayout(context, attrs, defStyleAttr) {
    init {
        clipToOutline = true
    }
}
