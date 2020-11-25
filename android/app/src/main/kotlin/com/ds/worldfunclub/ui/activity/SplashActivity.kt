package com.ds.worldfunclub.ui.activity

import android.graphics.Color
import android.os.Handler
import android.util.Log
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.*
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSplashComponent
import com.ds.worldfunclub.di.module.SplashModule
import com.ds.worldfunclub.viewmodel.SplashModel


/**
 * @Authod 12031
 * @Date 2020/7/4 11:02
 */
class SplashActivity : BaseActivity<SplashModel>() {
    override fun layoutId() = R.layout.activity_splash

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerSplashComponent.builder()
            .appComponent(appComponent)
            .splashModule(SplashModule(this))
            .build()
            .linked(this)
    }

}