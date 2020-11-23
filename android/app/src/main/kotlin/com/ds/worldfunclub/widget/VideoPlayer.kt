package com.ds.worldfunclub.widget

import android.content.Context
import android.util.AttributeSet
import android.widget.VideoView
import androidx.annotation.AttrRes
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent

/**
 * 普通的视频播放器
 * Created by GuoShaoHong on 2017/7/25.
 */
class VideoPlayer : VideoView, LifecycleObserver {
    /**
     * 由ijkplayer提供，用于播放视频，需要给他传入一个surfaceView
     */
    /**
     * 视频文件地址
     */

    constructor(context: Context) : super(context) {
        initVideoView(context)
    }

    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs) {
        initVideoView(context)
    }

    constructor(context: Context, attrs: AttributeSet?, @AttrRes defStyleAttr: Int) : super(
        context,
        attrs,
        defStyleAttr
    ) {
        initVideoView(context)
    }

    private fun initVideoView(context: Context) {
        (context as AppCompatActivity).lifecycle.addObserver(this)
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_PAUSE)
    fun onPause() {
        if (isPlaying) {
            pause()
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_RESUME)
    fun onResume() {
        if (!isPlaying)
            resume()
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onDestroy() {
        stopPlayback()
        (context as AppCompatActivity).lifecycle.removeObserver(this)
    }


}
