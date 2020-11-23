package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.ui.activity.MainActivity
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.MainModule
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/4 14:38
 */


@ActivityScope
@Component(modules = [MainModule::class], dependencies = [AppComponent::class])
interface MainComponent {
    fun linked(activity: MainActivity)
}