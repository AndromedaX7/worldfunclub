package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.ui.activity.SplashActivity
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SplashModule
import dagger.Component

/**
 * @Authod 12031
 * @Date 2020/7/4 11:06
 */


@ActivityScope
@Component(modules = [SplashModule::class], dependencies = [AppComponent::class])
interface SplashComponent {
    fun linked(activity: SplashActivity)
}