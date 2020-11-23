package com.ds.worldfunclub.ui.activity.vip

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.withdrawRecord
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerWithdrawRecordComponent
import com.ds.worldfunclub.di.module.WithdrawRecordModule
import com.ds.worldfunclub.viewmodel.WithdrawRecordModel

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午4:47
 */

@Route(path = withdrawRecord)
class WithdrawRecordActivity : BaseActivity<WithdrawRecordModel>() {
    override fun layoutId() = R.layout.activity_withdraw_record

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerWithdrawRecordComponent.builder()
            .appComponent(appComponent)
            .withdrawRecordModule(WithdrawRecordModule(this))
            .build()
            .linked(this)
    }
}