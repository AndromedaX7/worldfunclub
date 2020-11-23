package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.OrderConfirmModule
import com.ds.worldfunclub.ui.activity.order.OrderConfirmActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/15 下午4:22
 */


@ActivityScope
@Component(modules = [OrderConfirmModule::class], dependencies = [AppComponent::class])
interface OrderConfirmComponent {
    fun linked(activity: OrderConfirmActivity)
}
