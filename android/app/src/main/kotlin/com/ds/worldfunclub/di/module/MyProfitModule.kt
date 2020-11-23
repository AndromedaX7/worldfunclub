package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.vip.MyProfitActivity
import com.ds.worldfunclub.viewmodel.MyProfitModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/25 上午10:09
 */

@Module
class MyProfitModule(private val activity: MyProfitActivity) {

    @ActivityScope
    @Provides
    fun provideMyProfitModel(app: App, api: Api): MyProfitModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(MyProfitModel::class.java)

    }
}
