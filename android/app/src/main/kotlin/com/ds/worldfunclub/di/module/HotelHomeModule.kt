package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.hotel.HotelHomeActivity
import com.ds.worldfunclub.viewmodel.HotelHomeModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 11:03
 */

@Module
class HotelHomeModule(private val activity: HotelHomeActivity) {

    @ActivityScope
    @Provides
    fun provideHotelHomeModel(app: App, api: Api): HotelHomeModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(HotelHomeModel::class.java)

    }
}