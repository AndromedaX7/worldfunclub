package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.OrderLiveListModule
import com.ds.worldfunclub.ui.activity.order.OrderLiveListActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/24 16:18
 */


@ActivityScope
@Component(modules = [OrderLiveListModule::class], dependencies = [AppComponent::class])
interface OrderLiveListComponent {
    fun linked(activity: OrderLiveListActivity)
}
