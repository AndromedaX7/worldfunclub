package com.ds.worldfunclub.ui.activity.vip

import android.graphics.Color
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerAddCardOfBankComponent
import com.ds.worldfunclub.di.module.AddCardOfBankModule
import com.ds.worldfunclub.viewmodel.AddCardOfBankModel

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午4:09
 */

class AddCardOfBankActivity : BaseActivity<AddCardOfBankModel>() {
    override fun layoutId() = R.layout.activity_add_card_of_bank

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerAddCardOfBankComponent.builder()
                .appComponent(appComponent)
                .addCardOfBankModule(AddCardOfBankModule(this))
                .build()
                .linked(this)
    }
}