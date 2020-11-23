package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.OrderListModule
import com.ds.worldfunclub.ui.activity.order.OrderListActivity
import dagger.Component

/**
 * @Author mi
 * @Date 2020/7/20 4:21 PM
 */


@ActivityScope
@Component(modules = [OrderListModule::class], dependencies = [AppComponent::class])
interface OrderListComponent {
    fun linked(activity: OrderListActivity)
}