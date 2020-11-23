package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SelfInfoContentModule
import com.ds.worldfunclub.ui.activity.settings.user.SelfInfoContentActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:24
 */


@ActivityScope
@Component(modules = [SelfInfoContentModule::class], dependencies = [AppComponent::class])
interface SelfInfoContentComponent {
    fun linked(activity: SelfInfoContentActivity)
}
