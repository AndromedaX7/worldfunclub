package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ExpressModule
import com.ds.worldfunclub.ui.activity.order.ExpressActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/11/3 14:13
 */


@ActivityScope
@Component(modules = [ExpressModule::class], dependencies = [AppComponent::class])
interface ExpressComponent {
    fun linked(activity: ExpressActivity)
}
