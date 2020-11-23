package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ModifyPhoneConfirmModule
import com.ds.worldfunclub.ui.activity.settings.security.ModifyPhoneConfirmActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:40
 */


@ActivityScope
@Component(modules = [ModifyPhoneConfirmModule::class], dependencies = [AppComponent::class])
interface ModifyPhoneConfirmComponent {
    fun linked(activity: ModifyPhoneConfirmActivity)
}
