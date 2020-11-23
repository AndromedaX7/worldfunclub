package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.hotel.HotelOrderCommitActivity
import com.ds.worldfunclub.viewmodel.HotelOrderCommitModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 11:51
 */

@Module
class HotelOrderCommitModule(private val activity: HotelOrderCommitActivity) {

    @ActivityScope
    @Provides
    fun provideHotelOrderCommitModel(app: App, api: Api): HotelOrderCommitModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(HotelOrderCommitModel::class.java)

    }
}