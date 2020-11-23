package com.ds.worldfunclub.widget

import android.app.Activity
import android.app.Application
import android.content.Context
import android.graphics.drawable.BitmapDrawable
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.WindowManager
import android.view.animation.TranslateAnimation
import android.widget.FrameLayout
import android.widget.PopupWindow
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import kotlinx.android.synthetic.main.view_window.view.*

object DropDownManager {

    var last: View? = null

    fun listen(app: App) {
        app.registerActivityLifecycleCallbacks(object : Application.ActivityLifecycleCallbacks {
            override fun onActivityPaused(activity: Activity) {
            }

            override fun onActivityResumed(activity: Activity) {
            }

            override fun onActivityStarted(activity: Activity) {
            }

            override fun onActivityDestroyed(activity: Activity) {

            }

            override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {
            }

            override fun onActivityStopped(activity: Activity) {
                dismiss()
            }

            override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle?) {
                Log.e("Activity OnCreate::", activity::class.java.toString())
            }
        })
    }

    fun instance(): DropDownManager {
        return this
    }

    fun attachView(target: View, view: View) {

        when (last) {
            null -> showContent(target, view)
            target -> dismiss()
            else -> {
                dismiss()
                showContent(target, view)
            }
        }
    }


    private fun showContent(target: View, view: View) {
        val location = IntArray(2)
        target.getLocationOnScreen(location)
        Log.e("target . y", "${target.y}")
        popupWindow =
            PopupWindow(
                view,
                WindowManager.LayoutParams.MATCH_PARENT,
                (target.resources.displayMetrics.heightPixels - (location[1] + target.height))
            )
        popupWindow!!.setBackgroundDrawable(BitmapDrawable())
        popupWindow!!.showAsDropDown(target, -5, 3)
        last = target
    }

    fun genSelectList(
        context: Context,
        viewWithData: View
    ): View {
        val view = LayoutInflater.from(context).inflate(R.layout.view_window, null, false)
        val mask = view.mask

        mask.post {
            val alphaAnimation = TranslateAnimation(0f, 0f, -mask.height.toFloat(), 0f)
            alphaAnimation.duration = 500
            mask.animation = alphaAnimation
        }

        viewWithData.layoutParams =
            FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.WRAP_CONTENT
            )
        mask.addView(viewWithData)
        mask.setOnClickListener {
            dismiss()
        }
        return view
    }


    fun dismiss() {
        popupWindow?.run {
            if (isShowing) {
                dismiss()
            }
        }
        last = null
    }

    var popupWindow: PopupWindow? = null


}