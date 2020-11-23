package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.HotelHomeModule
import com.ds.worldfunclub.ui.activity.live.hotel.HotelHomeActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 11:03
 */


@ActivityScope
@Component(modules = [HotelHomeModule::class], dependencies = [AppComponent::class])
interface HotelHomeComponent {
    fun linked(activity: HotelHomeActivity)
}