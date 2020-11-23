package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.HotelListModule
import com.ds.worldfunclub.ui.activity.live.hotel.HotelListActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 12:09
 */


@ActivityScope
@Component(modules = [HotelListModule::class], dependencies = [AppComponent::class])
interface HotelListComponent {
    fun linked(activity: HotelListActivity)
}