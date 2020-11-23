package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.MessageCenterModule
import com.ds.worldfunclub.ui.activity.MessageCenterActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/13 下午1:42
 */


@ActivityScope
@Component(modules = [MessageCenterModule::class], dependencies = [AppComponent::class])
interface MessageCenterComponent {
    fun linked(activity: MessageCenterActivity)
}
