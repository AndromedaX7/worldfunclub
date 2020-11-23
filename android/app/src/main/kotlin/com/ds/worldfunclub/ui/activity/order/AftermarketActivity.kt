package com.ds.worldfunclub.ui.activity.order

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.orderAftermarket
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerAftermarketComponent
import com.ds.worldfunclub.di.module.AftermarketModule
import com.ds.worldfunclub.viewmodel.AftermarketModel

/**
 * @Author tachibanako
 * @Date 2020/7/22 上午10:17
 */

@Route(path = orderAftermarket)
class AftermarketActivity : BaseActivity<AftermarketModel>() {
    override fun layoutId() = R.layout.activity_aftermarket

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerAftermarketComponent.builder()
            .appComponent(appComponent)
            .aftermarketModule(AftermarketModule(this))
            .build()
            .linked(this)
    }
}
