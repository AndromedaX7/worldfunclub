package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.LiveDelicacyModule
import com.ds.worldfunclub.ui.activity.live.delicicy.LiveDelicacyActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 12:31
 */


@ActivityScope
@Component(modules = [LiveDelicacyModule::class], dependencies = [AppComponent::class])
interface LiveDelicacyComponent {
    fun linked(activity: LiveDelicacyActivity)
}