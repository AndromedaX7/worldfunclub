package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.CasualShopModule
import com.ds.worldfunclub.ui.activity.live.casual.CasualShopActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 12:56
 */


@ActivityScope
@Component(modules = [CasualShopModule::class], dependencies = [AppComponent::class])
interface CasualShopComponent {
    fun linked(activity: CasualShopActivity)
}