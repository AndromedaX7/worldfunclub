package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.GetCouponActivity
import com.ds.worldfunclub.viewmodel.GetCouponModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 12:23
 */

@Module
class GetCouponModule(private val activity: GetCouponActivity) {

    @ActivityScope
    @Provides
    fun provideGetCouponModel(app: App, api: Api): GetCouponModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(GetCouponModel::class.java)

    }
}