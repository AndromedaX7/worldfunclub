package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.AccountAndSecurityModule
import com.ds.worldfunclub.ui.activity.settings.security.AccountAndSecurityActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:53
 */


@ActivityScope
@Component(modules = [AccountAndSecurityModule::class], dependencies = [AppComponent::class])
interface AccountAndSecurityComponent {
    fun linked(activity: AccountAndSecurityActivity)
}
