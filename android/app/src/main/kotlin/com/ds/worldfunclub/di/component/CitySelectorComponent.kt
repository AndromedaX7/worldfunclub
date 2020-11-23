package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.CitySelectorModule
import com.ds.worldfunclub.ui.activity.CitySelectorActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 12:37
 */


@ActivityScope
@Component(modules = [CitySelectorModule::class], dependencies = [AppComponent::class])
interface CitySelectorComponent {
    fun linked(activity: CitySelectorActivity)
}