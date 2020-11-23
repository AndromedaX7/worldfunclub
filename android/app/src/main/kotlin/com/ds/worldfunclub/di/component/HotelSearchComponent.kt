package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.HotelSearchModule
import com.ds.worldfunclub.ui.activity.live.hotel.HotelSearchActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 11:55
 */


@ActivityScope
@Component(modules = [HotelSearchModule::class], dependencies = [AppComponent::class])
interface HotelSearchComponent {
    fun linked(activity: HotelSearchActivity)
}