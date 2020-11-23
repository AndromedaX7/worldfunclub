package com.ds.worldfunclub.ui.activity.merchant

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.withdrawBusi
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerWithdrawBusiComponent
import com.ds.worldfunclub.di.module.WithdrawBusiModule
import com.ds.worldfunclub.viewmodel.WithdrawBusiModel

/**
 * @Author miaom
 * @Date 2020/10/15 13:52
 */

@Route(path = withdrawBusi)
class WithdrawBusiActivity : BaseActivity<WithdrawBusiModel>() {
    override fun layoutId() = R.layout.activity_withdraw_busi

    override fun init(appComponent: AppComponent) {
        DaggerWithdrawBusiComponent.builder()
            .appComponent(appComponent)
            .withdrawBusiModule(WithdrawBusiModule(this))
            .build()
            .linked(this)
    }
}