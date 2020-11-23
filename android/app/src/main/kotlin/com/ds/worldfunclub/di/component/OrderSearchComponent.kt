package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.OrderSearchModule
import com.ds.worldfunclub.ui.activity.order.OrderSearchActivity
import dagger.Component

/**
 * @Author mi
 * @Date 2020/8/19 9:59 AM
 */


@ActivityScope
@Component(modules = [OrderSearchModule::class], dependencies = [AppComponent::class])
interface OrderSearchComponent {
    fun linked(activity: OrderSearchActivity)
}
