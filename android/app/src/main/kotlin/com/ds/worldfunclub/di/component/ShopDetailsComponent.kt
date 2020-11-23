package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ShopDetailsModule
import com.ds.worldfunclub.ui.activity.goods.ShopDetailsActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/15 11:01
 */


@ActivityScope
@Component(modules = [ShopDetailsModule::class], dependencies = [AppComponent::class])
interface ShopDetailsComponent {
    fun linked(activity: ShopDetailsActivity)
}
