package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.PingjiaDetailsModule
import com.ds.worldfunclub.ui.activity.PingjiaDetailsActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/10 14:37
 */


@ActivityScope
@Component(modules = [PingjiaDetailsModule::class], dependencies = [AppComponent::class])
interface PingjiaDetailsComponent {
    fun linked(activity: PingjiaDetailsActivity)
}
