package com.ds.worldfunclub.ui.activity.vip

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.myProfit
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMyProfitComponent
import com.ds.worldfunclub.di.module.MyProfitModule
import com.ds.worldfunclub.viewmodel.MyProfitModel

/**
 * @Author nekoneko
 * @Date 2020/7/25 上午10:08
 */
@Route(path = myProfit)
class MyProfitActivity : BaseActivity<MyProfitModel>() {
    override fun layoutId() = R.layout.activity_my_profit

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerMyProfitComponent.builder()
            .appComponent(appComponent)
            .myProfitModule(MyProfitModule(this))
            .build()
            .linked(this)
    }
}