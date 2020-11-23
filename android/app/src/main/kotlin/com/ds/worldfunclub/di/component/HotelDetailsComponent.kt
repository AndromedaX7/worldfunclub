package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.HotelDetailsModule
import com.ds.worldfunclub.ui.activity.live.hotel.HotelDetailsActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 11:34
 */


@ActivityScope
@Component(modules = [HotelDetailsModule::class], dependencies = [AppComponent::class])
interface HotelDetailsComponent {
    fun linked(activity: HotelDetailsActivity)
}