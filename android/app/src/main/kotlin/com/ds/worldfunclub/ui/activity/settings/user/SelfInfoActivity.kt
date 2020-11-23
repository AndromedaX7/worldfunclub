package com.ds.worldfunclub.ui.activity.settings.user

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.selfInfo
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSelfInfoComponent
import com.ds.worldfunclub.di.module.SelfInfoModule
import com.ds.worldfunclub.viewmodel.SelfInfoModel

/**
 * @Author mi
 * @Date 2020/7/19 9:15 AM
 */

@Route(path = selfInfo)
class SelfInfoActivity : BaseActivity<SelfInfoModel>() {
    override fun layoutId() = R.layout.activity_self_info

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerSelfInfoComponent.builder()
            .appComponent(appComponent)
            .selfInfoModule(SelfInfoModule(this))
            .build()
            .linked(this)
    }

//    override fun statusBarColor()=SkinManager.getColor(R.color.colorToolbar)
//
//    override fun needChangeGlobalStyle()=true
//
//    override fun needChangeStatusColor()=true
}
