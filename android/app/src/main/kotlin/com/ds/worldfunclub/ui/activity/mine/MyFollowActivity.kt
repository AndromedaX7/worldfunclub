package com.ds.worldfunclub.ui.activity.mine

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.myFollowShop
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMyFollowComponent
import com.ds.worldfunclub.di.module.MyFollowModule
import com.ds.worldfunclub.viewmodel.MyFollowModel

/**
 * @Author tachibanako
 * @Date 2020/7/22 上午9:23
 */

@Route(path = myFollowShop)
class MyFollowActivity : BaseActivity<MyFollowModel>() {
    override fun layoutId() = R.layout.activity_my_follow

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerMyFollowComponent.builder()
            .appComponent(appComponent)
            .myFollowModule(MyFollowModule(this))
            .build()
            .linked(this)
    }
}
