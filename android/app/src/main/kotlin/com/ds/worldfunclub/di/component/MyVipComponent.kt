package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.MyVipModule
import com.ds.worldfunclub.ui.activity.vip.MyVipActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/25 上午9:30
 */


@ActivityScope
@Component(modules = [MyVipModule::class], dependencies = [AppComponent::class])
interface MyVipComponent {
    fun linked(activity: MyVipActivity)
}