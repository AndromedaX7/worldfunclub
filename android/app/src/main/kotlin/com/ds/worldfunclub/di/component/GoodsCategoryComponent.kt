package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.GoodsCategoryModule
import com.ds.worldfunclub.ui.activity.goods.GoodsCategoryActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/9 2:33
 */


@ActivityScope
@Component(modules = [GoodsCategoryModule::class], dependencies = [AppComponent::class])
interface GoodsCategoryComponent {
    fun linked(activity: GoodsCategoryActivity)
}
