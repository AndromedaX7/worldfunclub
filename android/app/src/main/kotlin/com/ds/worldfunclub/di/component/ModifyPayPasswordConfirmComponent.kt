package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ModifyPayPasswordConfirmModule
import com.ds.worldfunclub.ui.activity.settings.security.ModifyPayPasswordConfirmActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:33
 */


@ActivityScope
@Component(modules = [ModifyPayPasswordConfirmModule::class], dependencies = [AppComponent::class])
interface ModifyPayPasswordConfirmComponent {
    fun linked(activity: ModifyPayPasswordConfirmActivity)
}
