package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ModifyPayPasswordModule
import com.ds.worldfunclub.ui.activity.settings.security.ModifyPayPasswordActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:12
 */


@ActivityScope
@Component(modules = [ModifyPayPasswordModule::class], dependencies = [AppComponent::class])
interface ModifyPayPasswordComponent {
    fun linked(activity: ModifyPayPasswordActivity)
}
