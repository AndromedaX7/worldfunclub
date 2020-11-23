package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.WelfareOfNewComersModule
import com.ds.worldfunclub.ui.activity.homeentry.WelfareOfNewComersActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/14 13:34
 */


@ActivityScope
@Component(modules = [WelfareOfNewComersModule::class], dependencies = [AppComponent::class])
interface WelfareOfNewComersComponent {
    fun linked(activity: WelfareOfNewComersActivity)
}
