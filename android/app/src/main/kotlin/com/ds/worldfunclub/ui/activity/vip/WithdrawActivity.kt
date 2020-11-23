package com.ds.worldfunclub.ui.activity.vip

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.withdraw
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerWithdrawComponent
import com.ds.worldfunclub.di.module.WithdrawModule
import com.ds.worldfunclub.viewmodel.WithdrawModel

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午3:03
 */

@Route(path = withdraw)
class WithdrawActivity : BaseActivity<WithdrawModel>() {
    override fun layoutId() = R.layout.activity_withdraw

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerWithdrawComponent.builder()
            .appComponent(appComponent)
            .withdrawModule(WithdrawModule(this))
            .build()
            .linked(this)
    }

    @Autowired
    @JvmField
    var shop =false
}