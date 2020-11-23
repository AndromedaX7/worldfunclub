package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.BindPhoneModule
import com.ds.worldfunclub.ui.activity.login.BindPhoneActivity
import dagger.Component

/**
 * @Author mi
 * @Date 2020/8/19 3:23 PM
 */


@ActivityScope
@Component(modules = [BindPhoneModule::class], dependencies = [AppComponent::class])
interface BindPhoneComponent {
    fun linked(activity: BindPhoneActivity)
}
