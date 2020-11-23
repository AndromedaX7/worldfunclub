package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.ImageSelectedModule
import com.ds.worldfunclub.ui.activity.ImageSelectedActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/16 15:39
 */


@ActivityScope
@Component(modules = [ImageSelectedModule::class], dependencies = [AppComponent::class])
interface ImageSelectedComponent {
    fun linked(activity: ImageSelectedActivity)
}
