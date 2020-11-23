package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.AddCardOfBankModule
import com.ds.worldfunclub.ui.activity.vip.AddCardOfBankActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午4:10
 */


@ActivityScope
@Component(modules = [AddCardOfBankModule::class], dependencies = [AppComponent::class])
interface AddCardOfBankComponent {
    fun linked(activity: AddCardOfBankActivity)
}