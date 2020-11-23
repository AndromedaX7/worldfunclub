package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.BusinessBackgroundModule
import com.ds.worldfunclub.ui.activity.merchant.BusinessBackgroundActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/14 16:13
 */


@ActivityScope
@Component(modules = [BusinessBackgroundModule::class], dependencies = [AppComponent::class])
interface BusinessBackgroundComponent {
    fun linked(activity: BusinessBackgroundActivity)
}
