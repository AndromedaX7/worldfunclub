package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.LoginPhoneModule
import com.ds.worldfunclub.ui.activity.login.LoginPhoneActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/8/21 下午2:38
 */


@ActivityScope
@Component(modules = [LoginPhoneModule::class], dependencies = [AppComponent::class])
interface LoginPhoneComponent {
    fun linked(activity: LoginPhoneActivity)
}