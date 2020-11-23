package com.ds.worldfunclub.ui.activity.live.delicicy

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.delicacyHome
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerLiveDelicacyComponent
import com.ds.worldfunclub.di.module.LiveDelicacyModule
import com.ds.worldfunclub.viewmodel.LiveDelicacyModel

/**
 * @Author 12031
 * @Date 2020/8/19 12:30
 */
@Route(path = delicacyHome)
class LiveDelicacyActivity : BaseActivity<LiveDelicacyModel>() {
    override fun layoutId() = R.layout.activity_delicacy

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerLiveDelicacyComponent.builder()
            .appComponent(appComponent)
            .liveDelicacyModule(LiveDelicacyModule(this))
            .build()
            .linked(this)
    }
}