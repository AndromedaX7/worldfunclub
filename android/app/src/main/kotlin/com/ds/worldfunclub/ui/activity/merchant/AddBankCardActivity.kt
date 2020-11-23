package com.ds.worldfunclub.ui.activity.merchant

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerAddBankCardComponent
import com.ds.worldfunclub.di.module.AddBankCardModule
import com.ds.worldfunclub.viewmodel.AddBankCardModel

/**
 * @Author miaom
 * @Date 2020/10/15 13:33
 */
class AddBankCardActivity : BaseActivity<AddBankCardModel>() {
    override fun layoutId() = R.layout.activity_add_bank_card_busi

    override fun init(appComponent: AppComponent) {
        DaggerAddBankCardComponent.builder()
            .appComponent(appComponent)
            .addBankCardModule(AddBankCardModule(this))
            .build()
            .linked(this)
    }
}