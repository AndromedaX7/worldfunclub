package com.ds.worldfunclub.ui.activity.vip

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.myVip
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMyVipComponent
import com.ds.worldfunclub.di.module.MyVipModule
import com.ds.worldfunclub.viewmodel.MyVipModel

/**
 * @Author nekoneko
 * @Date 2020/7/25 上午9:30
 */

@Route(path = myVip)
class MyVipActivity : BaseActivity<MyVipModel>() {
    override fun layoutId() = R.layout.activity_my_vip

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerMyVipComponent.builder()
            .appComponent(appComponent)
            .myVipModule(MyVipModule(this))
            .build()
            .linked(this)
    }
}