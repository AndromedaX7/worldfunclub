package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.TopSellingListModule
import com.ds.worldfunclub.ui.activity.homeentry.TopSellingListActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/14 14:19
 */


@ActivityScope
@Component(modules = [TopSellingListModule::class], dependencies = [AppComponent::class])
interface TopSellingListComponent {
    fun linked(activity: TopSellingListActivity)
}
