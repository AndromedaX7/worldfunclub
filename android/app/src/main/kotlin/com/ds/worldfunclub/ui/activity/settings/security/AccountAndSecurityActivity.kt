package com.ds.worldfunclub.ui.activity.settings.security

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.accountAndSecurity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerAccountAndSecurityComponent
import com.ds.worldfunclub.di.module.AccountAndSecurityModule
import com.ds.worldfunclub.viewmodel.AccountAndSecurityModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:52
 */

@Route(path = accountAndSecurity)
class AccountAndSecurityActivity : BaseActivity<AccountAndSecurityModel>() {
    override fun layoutId() = R.layout.activity_account_security

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerAccountAndSecurityComponent.builder()
            .appComponent(appComponent)
            .accountAndSecurityModule(AccountAndSecurityModule(this))
            .build()
            .linked(this)
    }
}
