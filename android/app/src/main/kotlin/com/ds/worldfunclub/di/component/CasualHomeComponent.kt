package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.CasualHomeModule
import com.ds.worldfunclub.ui.activity.live.casual.CasualHomeActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 12:44
 */


@ActivityScope
@Component(modules = [CasualHomeModule::class], dependencies = [AppComponent::class])
interface CasualHomeComponent {
    fun linked(activity: CasualHomeActivity)
}