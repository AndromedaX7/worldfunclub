package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ManoeuvreModule
import com.ds.worldfunclub.ui.activity.ManoeuvreActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/13 14:20
 */


@ActivityScope
@Component(modules = [ManoeuvreModule::class], dependencies = [AppComponent::class])
interface ManoeuvreComponent {
    fun linked(activity: ManoeuvreActivity)
}
