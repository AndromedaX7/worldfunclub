package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.WithdrawRecordModule
import com.ds.worldfunclub.ui.activity.vip.WithdrawRecordActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午4:45
 */


@ActivityScope
@Component(modules = [WithdrawRecordModule::class], dependencies = [AppComponent::class])
interface WithdrawRecordComponent {
    fun linked(activity: WithdrawRecordActivity)
}