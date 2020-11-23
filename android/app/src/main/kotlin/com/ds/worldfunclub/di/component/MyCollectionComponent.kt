package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.MyCollectionModule
import com.ds.worldfunclub.ui.activity.mine.MyCollectionActivity
import dagger.Component

/**
 * @Author tachibanako
 * @Date 2020/7/22 下午12:07
 */


@ActivityScope
@Component(modules = [MyCollectionModule::class], dependencies = [AppComponent::class])
interface MyCollectionComponent {
    fun linked(activity: MyCollectionActivity)
}
