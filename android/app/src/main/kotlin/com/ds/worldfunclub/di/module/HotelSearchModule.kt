package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.hotel.HotelSearchActivity
import com.ds.worldfunclub.viewmodel.HotelSearchModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 11:55
 */

@Module
class HotelSearchModule(private val activity: HotelSearchActivity) {

    @ActivityScope
    @Provides
    fun provideHotelSearchModel(app: App, api: Api): HotelSearchModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(HotelSearchModel::class.java)

    }
}