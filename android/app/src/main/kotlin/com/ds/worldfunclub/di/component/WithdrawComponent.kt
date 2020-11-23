package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.WithdrawModule
import com.ds.worldfunclub.ui.activity.vip.WithdrawActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午3:04
 */


@ActivityScope
@Component(modules = [WithdrawModule::class], dependencies = [AppComponent::class])
interface WithdrawComponent {
    fun linked(activity: WithdrawActivity)
}