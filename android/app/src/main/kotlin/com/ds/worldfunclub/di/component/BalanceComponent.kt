package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.BalanceModule
import com.ds.worldfunclub.ui.activity.mine.BalanceActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午1:55
 */


@ActivityScope
@Component(modules = [BalanceModule::class], dependencies = [AppComponent::class])
interface BalanceComponent {
    fun linked(activity: BalanceActivity)
}