package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SettingsModule
import com.ds.worldfunclub.ui.activity.settings.SettingsActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/18 上午10:43
 */


@ActivityScope
@Component(modules = [SettingsModule::class], dependencies = [AppComponent::class])
interface SettingsComponent {
    fun linked(activity: SettingsActivity)
}
