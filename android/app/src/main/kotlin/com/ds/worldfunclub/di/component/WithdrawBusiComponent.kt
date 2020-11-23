package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.WithdrawBusiModule
import com.ds.worldfunclub.ui.activity.merchant.WithdrawBusiActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/15 13:53
 */


@ActivityScope
@Component(modules = [WithdrawBusiModule::class], dependencies = [AppComponent::class])
interface WithdrawBusiComponent {
    fun linked(activity: WithdrawBusiActivity)
}
