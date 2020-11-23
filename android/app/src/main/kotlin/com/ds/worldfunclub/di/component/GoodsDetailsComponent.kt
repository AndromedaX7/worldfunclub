package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.GoodsDetailsModule
import com.ds.worldfunclub.ui.activity.goods.GoodsDetailsActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/9 15:23
 */


@ActivityScope
@Component(modules = [GoodsDetailsModule::class], dependencies = [AppComponent::class])
interface GoodsDetailsComponent {
    fun linked(activity: GoodsDetailsActivity)
}
