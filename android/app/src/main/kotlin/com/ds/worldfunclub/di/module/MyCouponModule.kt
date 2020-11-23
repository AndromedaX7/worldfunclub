package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.mine.MyCouponActivity
import com.ds.worldfunclub.viewmodel.MyCouponModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/23 上午9:46
 */

@Module
class MyCouponModule(private val activity: MyCouponActivity) {

    @ActivityScope
    @Provides
    fun provideMyCouponModel(app: App, api: Api): MyCouponModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(MyCouponModel::class.java)

    }
}
