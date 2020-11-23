package com.ds.worldfunclub.widget

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.util.AttributeSet
import android.util.Log
import android.view.View
import com.ds.worldfunclub.base.DataBindingAdapter
import kotlin.math.pow
import kotlin.math.sqrt

class BannerView constructor(c: Context, attr: AttributeSet?) : View(c, attr) {

    constructor(c: Context) : this(c, null)

    val bannerHeight = DataBindingAdapter.dp2px(context, 25).toFloat()
    val maxHeight = DataBindingAdapter.dp2px(context, 54).toFloat()


    init {
        Log.e("max", "${sqrt(54.0.pow(2.0) + 54.0.pow(2.0))}")

        Log.e("min", "${sqrt(29.0.pow(2.0) + 29.0.pow(2.0))}")

        Log.e(
            "curr",
            "${sqrt(54.0.pow(2.0) + 54.0.pow(2.0)) - sqrt(29.0.pow(2.0) + 29.0.pow(2.0))}"
        )

    }

    val paintBanner = Paint()

    init {
        paintBanner.style = Paint.Style.FILL
        paintBanner.isAntiAlias = true
        paintBanner.color = Color.parseColor("#FF354D")
    }

    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)
        canvas?.let {
            val path = Path()
            path.moveTo(0f, 0f)
            path.lineTo(maxHeight, maxHeight)
            path.lineTo(maxHeight, maxHeight - bannerHeight)
            path.lineTo(bannerHeight, 0f)
            canvas.drawPath(path, paintBanner)
        }
    }


}