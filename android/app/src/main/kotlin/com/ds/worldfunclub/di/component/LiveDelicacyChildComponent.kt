package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.LiveDelicacyChildModule
import com.ds.worldfunclub.ui.activity.live.delicicy.LiveDelicacyChildActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/28 上午10:11
 */


@ActivityScope
@Component(modules = [LiveDelicacyChildModule::class], dependencies = [AppComponent::class])
interface LiveDelicacyChildComponent {
    fun linked(activity: LiveDelicacyChildActivity)
}