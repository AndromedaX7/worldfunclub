package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.DelicicyDetailsModule
import com.ds.worldfunclub.ui.activity.live.delicicy.DelicacyDetailsActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/21 11:46
 */


@ActivityScope
@Component(modules = [DelicicyDetailsModule::class], dependencies = [AppComponent::class])
interface DelicicyDetailsComponent {
    fun linked(activity: DelicacyDetailsActivity)
}
