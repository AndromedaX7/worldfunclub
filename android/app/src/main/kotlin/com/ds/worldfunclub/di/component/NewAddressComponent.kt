package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.NewAddressModule
import com.ds.worldfunclub.ui.activity.goods.NewAddressActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/15 下午2:57
 */


@ActivityScope
@Component(modules = [NewAddressModule::class], dependencies = [AppComponent::class])
interface NewAddressComponent {
    fun linked(activity: NewAddressActivity)
}
