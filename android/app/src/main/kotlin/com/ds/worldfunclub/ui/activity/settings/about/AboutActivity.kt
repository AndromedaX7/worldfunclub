package com.ds.worldfunclub.ui.activity.settings.about

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.aboutUs
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerAboutComponent
import com.ds.worldfunclub.di.module.AboutModule
import com.ds.worldfunclub.viewmodel.AboutModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:31
 */
@Route(path = aboutUs)
class AboutActivity : BaseActivity<AboutModel>() {
    override fun layoutId() = R.layout.activity_about_us

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerAboutComponent.builder()
            .appComponent(appComponent)
            .aboutModule(AboutModule(this))
            .build()
            .linked(this)
    }
}
