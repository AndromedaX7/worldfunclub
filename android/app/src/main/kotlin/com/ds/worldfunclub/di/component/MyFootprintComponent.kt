package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.MyFootprintModule
import com.ds.worldfunclub.ui.activity.mine.MyFootprintActivity
import dagger.Component

/**
 * @Author nekoneko
 * @Date 2020/7/29 上午9:21
 */


@ActivityScope
@Component(modules = [MyFootprintModule::class], dependencies = [AppComponent::class])
interface MyFootprintComponent {
    fun linked(activity: MyFootprintActivity)
}