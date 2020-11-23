package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.CartModule
import com.ds.worldfunclub.ui.activity.goods.CartActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/16 下午1:57
 */


@ActivityScope
@Component(modules = [CartModule::class], dependencies = [AppComponent::class])
interface CartComponent {
    fun linked(activity: CartActivity)
}
