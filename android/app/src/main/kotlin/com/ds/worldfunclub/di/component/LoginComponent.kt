package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.LoginModule
import com.ds.worldfunclub.ui.activity.login.LoginActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/25 下午3:52
 */


@ActivityScope
@Component(modules = [LoginModule::class], dependencies = [AppComponent::class])
interface LoginComponent {
    fun linked(activity: LoginActivity)
}