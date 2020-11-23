package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.DelicacyCommitModule
import com.ds.worldfunclub.ui.activity.order.DelicacyCommitActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/22 16:56
 */


@ActivityScope
@Component(modules = [DelicacyCommitModule::class], dependencies = [AppComponent::class])
interface DelicacyCommitComponent {
    fun linked(activity: DelicacyCommitActivity)
}
