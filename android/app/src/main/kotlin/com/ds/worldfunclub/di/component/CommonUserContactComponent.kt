package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.CommonUserContactModule
import com.ds.worldfunclub.ui.activity.settings.commonuser.CommonUserContactActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:18
 */


@ActivityScope
@Component(modules = [CommonUserContactModule::class], dependencies = [AppComponent::class])
interface CommonUserContactComponent {
    fun linked(activity: CommonUserContactActivity)
}
