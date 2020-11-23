package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.CategoryGoodsLastModule
import com.ds.worldfunclub.ui.activity.goods.CategoryGoodsLastActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/21 16:30
 */


@ActivityScope
@Component(modules = [CategoryGoodsLastModule::class], dependencies = [AppComponent::class])
interface CategoryGoodsLastComponent {
    fun linked(activity: CategoryGoodsLastActivity)
}
