package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.HotelOrderCommitModule
import com.ds.worldfunclub.ui.activity.live.hotel.HotelOrderCommitActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/8/19 11:50
 */


@ActivityScope
@Component(modules = [HotelOrderCommitModule::class], dependencies = [AppComponent::class])
interface HotelOrderCommitComponent {
    fun linked(activity: HotelOrderCommitActivity)
}