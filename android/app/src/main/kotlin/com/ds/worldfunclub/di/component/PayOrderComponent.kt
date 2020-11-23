package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.PayOrderModule
import com.ds.worldfunclub.ui.activity.order.PayOrderActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/26 14:53
 */


@ActivityScope
@Component(modules = [PayOrderModule::class], dependencies = [AppComponent::class])
interface PayOrderComponent {
    fun linked(activity: PayOrderActivity)
}
