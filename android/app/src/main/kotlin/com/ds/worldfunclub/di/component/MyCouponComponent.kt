package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.MyCouponModule
import com.ds.worldfunclub.ui.activity.mine.MyCouponActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/23 上午9:46
 */


@ActivityScope
@Component(modules = [MyCouponModule::class], dependencies = [AppComponent::class])
interface MyCouponComponent {
    fun linked(activity: MyCouponActivity)
}