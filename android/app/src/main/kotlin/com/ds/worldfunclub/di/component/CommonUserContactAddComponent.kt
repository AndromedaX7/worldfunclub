package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.CommonUserContactAddModule
import com.ds.worldfunclub.ui.activity.settings.commonuser.CommonUserContactAddActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:21
 */


@ActivityScope
@Component(modules = [CommonUserContactAddModule::class], dependencies = [AppComponent::class])
interface CommonUserContactAddComponent {
    fun linked(activity: CommonUserContactAddActivity)
}
