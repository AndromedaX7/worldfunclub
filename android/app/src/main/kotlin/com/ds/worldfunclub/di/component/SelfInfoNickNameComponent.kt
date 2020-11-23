package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SelfInfoNickNameModule
import com.ds.worldfunclub.ui.activity.settings.user.SelfInfoNickNameActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:44
 */


@ActivityScope
@Component(modules = [SelfInfoNickNameModule::class], dependencies = [AppComponent::class])
interface SelfInfoNickNameComponent {
    fun linked(activity: SelfInfoNickNameActivity)
}
