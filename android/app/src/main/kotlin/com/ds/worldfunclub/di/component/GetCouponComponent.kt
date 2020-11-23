package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.GetCouponModule
import com.ds.worldfunclub.ui.activity.live.GetCouponActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 12:23
 */


@ActivityScope
@Component(modules = [GetCouponModule::class], dependencies = [AppComponent::class])
interface GetCouponComponent {
    fun linked(activity: GetCouponActivity)
}