package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.BrandSelectionModule
import com.ds.worldfunclub.ui.activity.homeentry.BrandSelectionActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/14 14:07
 */


@ActivityScope
@Component(modules = [BrandSelectionModule::class], dependencies = [AppComponent::class])
interface BrandSelectionComponent {
    fun linked(activity: BrandSelectionActivity)
}
