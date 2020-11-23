package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.ui.activity.SearchActivity
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SearchModule
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/8 10:48
 */


@ActivityScope
@Component(modules = [SearchModule::class], dependencies = [AppComponent::class])
interface SearchComponent {
    fun linked(activity: SearchActivity)
}
