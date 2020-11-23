package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ShopListModule
import com.ds.worldfunclub.ui.activity.live.ShopListActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/29 下午3:16
 */


@ActivityScope
@Component(modules = [ShopListModule::class], dependencies = [AppComponent::class])
interface ShopListComponent {
    fun linked(activity: ShopListActivity)
}