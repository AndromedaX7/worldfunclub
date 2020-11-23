package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.AftermarketModule
import com.ds.worldfunclub.ui.activity.order.AftermarketActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/22 上午10:18
 */


@ActivityScope
@Component(modules = [AftermarketModule::class], dependencies = [AppComponent::class])
interface AftermarketComponent  {
    fun linked(activity: AftermarketActivity)
}
