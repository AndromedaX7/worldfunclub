package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.hotel.HotelListActivity
import com.ds.worldfunclub.viewmodel.HotelListModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 12:09
 */

@Module
class HotelListModule(private val activity: HotelListActivity) {

    @ActivityScope
    @Provides
    fun provideHotelListModel(app: App, api: Api): HotelListModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(HotelListModel::class.java)

    }
}