package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.WriteOffModule
import com.ds.worldfunclub.ui.activity.merchant.WriteOffActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/14 16:15
 */


@ActivityScope
@Component(modules = [WriteOffModule::class], dependencies = [AppComponent::class])
interface WriteOffComponent {
    fun linked(activity: WriteOffActivity)
}
