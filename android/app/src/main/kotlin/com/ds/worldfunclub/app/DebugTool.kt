package com.ds.worldfunclub.app

import android.app.Activity
import android.app.Application
import android.os.Bundle
import android.util.Log
import com.ds.worldfunclub.BuildConfig

fun App.debugActivityLifeCycle() {
    if (BuildConfig.DEBUG)
        registerActivityLifecycleCallbacks(DebugActivityLifeCycleCallback())
}

class DebugActivityLifeCycleCallback : Application.ActivityLifecycleCallbacks {
    private val TAG = "Debug LFC"
    override fun onActivityPaused(p0: Activity) {
        Log.d(TAG, "onActivityPaused(${p0.javaClass.name})")
    }

    override fun onActivityStarted(p0: Activity) {
        Log.d(TAG, "onActivityStarted(${p0.javaClass.name})")
    }

    override fun onActivityDestroyed(p0: Activity) {
        Log.d(TAG, "onActivityDestroyed(${p0.javaClass.name})")
    }

    override fun onActivitySaveInstanceState(p0: Activity, p1: Bundle) {
        Log.d(TAG, "onActivitySaveInstanceState(${p0.javaClass.name},$p1)")
    }

    override fun onActivityStopped(p0: Activity) {
        Log.d(TAG, "onActivityStopped(${p0.javaClass.name})")
    }

    override fun onActivityCreated(p0: Activity, p1: Bundle?) {
        Log.d(TAG, "onActivityCreated(${p0.javaClass.name},$p1)")
    }

    override fun onActivityResumed(p0: Activity) {
        Log.d(TAG, "onActivityResumed(${p0.javaClass.name})")
    }

}