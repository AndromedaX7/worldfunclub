package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.PayCouponModule
import com.ds.worldfunclub.ui.activity.live.PayCouponActivity
import dagger.Component

/**
 * @Author mi
 * @Date 2020/8/19 10:22 AM
 */


@ActivityScope
@Component(modules = [PayCouponModule::class], dependencies = [AppComponent::class])
interface PayCouponComponent {
    fun linked(activity: PayCouponActivity)
}
