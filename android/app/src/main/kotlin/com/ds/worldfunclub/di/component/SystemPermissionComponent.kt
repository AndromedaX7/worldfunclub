package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SystemPermissionModule
import com.ds.worldfunclub.ui.activity.settings.security.SystemPermissionActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午11:52
 */


@ActivityScope
@Component(modules = [SystemPermissionModule::class], dependencies = [AppComponent::class])
interface SystemPermissionComponent {
    fun linked(activity: SystemPermissionActivity)
}
