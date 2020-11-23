package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.hotel.HotelDetailsActivity
import com.ds.worldfunclub.viewmodel.HotelDetailsModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 11:34
 */

@Module
class HotelDetailsModule(private val activity: HotelDetailsActivity) {

    @ActivityScope
    @Provides
    fun provideHotelDetailsModel(app: App, api: Api): HotelDetailsModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(HotelDetailsModel::class.java)

    }
}