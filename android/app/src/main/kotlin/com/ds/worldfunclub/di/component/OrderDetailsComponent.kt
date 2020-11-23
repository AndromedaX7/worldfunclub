package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.OrderDetailsModule
import com.ds.worldfunclub.ui.activity.order.OrderDetailsActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午2:39
 */


@ActivityScope
@Component(modules = [OrderDetailsModule::class], dependencies = [AppComponent::class])
interface OrderDetailsComponent {
    fun linked(activity: OrderDetailsActivity)
}
