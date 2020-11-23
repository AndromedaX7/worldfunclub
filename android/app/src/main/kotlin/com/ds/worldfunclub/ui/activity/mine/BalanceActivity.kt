package com.ds.worldfunclub.ui.activity.mine

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.balance
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerBalanceComponent
import com.ds.worldfunclub.di.module.BalanceModule
import com.ds.worldfunclub.viewmodel.BalanceModel

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午1:54
 */

@Route(path = balance)
class BalanceActivity : BaseActivity<BalanceModel>() {
    override fun layoutId() = R.layout.activity_balance

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerBalanceComponent.builder()
            .appComponent(appComponent)
            .balanceModule(BalanceModule(this))
            .build()
            .linked(this)
    }
}