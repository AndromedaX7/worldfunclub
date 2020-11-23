package com.ds.worldfunclub.ui.activity.settings

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.settings
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSettingsComponent
import com.ds.worldfunclub.di.module.SettingsModule
import com.ds.worldfunclub.viewmodel.SettingsModel

/**
 * @Author tachibanako
 * @Date 2020/7/18 上午10:42
 */

@Route(path = settings)
class SettingsActivity : BaseActivity<SettingsModel>() {
    override fun layoutId() = R.layout.activity_settings

    override fun init(appComponent: AppComponent) {
        transparentStatus( Color.WHITE)
        DaggerSettingsComponent.builder()
            .appComponent(appComponent)
            .settingsModule(SettingsModule(this))
            .build()
            .linked(this)
    }



//    override fun needChangeStatusColor() = false
//    override fun needChangeGlobalStyle() = false
//
//    override fun statusBarColor(): Int {
//        return SkinManager.getColor(R.color.colorToolbar)
//    }
    companion object {
        const val turnHomeExit = 10
    }
}
