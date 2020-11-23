package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.MyFollowModule
import com.ds.worldfunclub.ui.activity.mine.MyFollowActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/22 上午9:24
 */


@ActivityScope
@Component(modules = [MyFollowModule::class], dependencies = [AppComponent::class])
interface MyFollowComponent {
    fun linked(activity: MyFollowActivity)
}
