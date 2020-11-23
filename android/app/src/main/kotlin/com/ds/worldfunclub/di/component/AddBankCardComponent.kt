package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.AddBankCardModule
import com.ds.worldfunclub.ui.activity.merchant.AddBankCardActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/15 13:34
 */


@ActivityScope
@Component(modules = [AddBankCardModule::class], dependencies = [AppComponent::class])
interface AddBankCardComponent {
    fun linked(activity: AddBankCardActivity)
}
