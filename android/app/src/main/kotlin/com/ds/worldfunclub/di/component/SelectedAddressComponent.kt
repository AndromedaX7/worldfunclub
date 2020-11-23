package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SelectedAddressModule
import com.ds.worldfunclub.ui.activity.goods.SelectedAddressActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/15 9:37
 */


@ActivityScope
@Component(modules = [SelectedAddressModule::class], dependencies = [AppComponent::class])
interface SelectedAddressComponent {
    fun linked(activity: SelectedAddressActivity)
}
