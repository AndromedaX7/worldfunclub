package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.AboutModule
import com.ds.worldfunclub.ui.activity.settings.about.AboutActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:31
 */


@ActivityScope
@Component(modules = [AboutModule::class], dependencies = [AppComponent::class])
interface AboutComponent {
    fun linked(activity: AboutActivity)
}
