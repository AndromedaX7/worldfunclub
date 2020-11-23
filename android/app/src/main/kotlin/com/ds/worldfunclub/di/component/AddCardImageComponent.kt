package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.AddCardImageModule
import com.ds.worldfunclub.ui.activity.vip.AddCardImageActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/25 下午2:36
 */


@ActivityScope
@Component(modules = [AddCardImageModule::class], dependencies = [AppComponent::class])
interface AddCardImageComponent {
    fun linked(activity: AddCardImageActivity)
}