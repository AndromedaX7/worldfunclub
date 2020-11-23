package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ModifyPhoneModule
import com.ds.worldfunclub.ui.activity.settings.security.ModifyPhoneActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:05
 */


@ActivityScope
@Component(modules = [ModifyPhoneModule::class], dependencies = [AppComponent::class])
interface ModifyPhoneComponent {
    fun linked(activity: ModifyPhoneActivity)
}
