package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SpecialOfferModule
import com.ds.worldfunclub.ui.activity.homeentry.SpecialOfferActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/14 14:28
 */


@ActivityScope
@Component(modules = [SpecialOfferModule::class], dependencies = [AppComponent::class])
interface SpecialOfferComponent {
    fun linked(activity: SpecialOfferActivity)
}
