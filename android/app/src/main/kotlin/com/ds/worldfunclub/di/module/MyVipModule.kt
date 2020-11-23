package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.vip.MyVipActivity
import com.ds.worldfunclub.viewmodel.MyVipModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/25 上午9:30
 */

@Module
class MyVipModule(private val activity: MyVipActivity) {

    @ActivityScope
    @Provides
    fun provideMyVipModel(app: App, api: Api): MyVipModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(MyVipModel::class.java)

    }
}
