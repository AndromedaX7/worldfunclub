package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.MyProfitModule
import com.ds.worldfunclub.ui.activity.vip.MyProfitActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/25 上午10:09
 */


@ActivityScope
@Component(modules = [MyProfitModule::class], dependencies = [AppComponent::class])
interface MyProfitComponent {
    fun linked(activity: MyProfitActivity)
}