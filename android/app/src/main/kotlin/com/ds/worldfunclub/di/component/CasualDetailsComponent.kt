package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.CasualDetailsModule
import com.ds.worldfunclub.ui.activity.live.casual.CasualDetailsActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 12:51
 */


@ActivityScope
@Component(modules = [CasualDetailsModule::class], dependencies = [AppComponent::class])
interface CasualDetailsComponent {
    fun linked(activity: CasualDetailsActivity)
}