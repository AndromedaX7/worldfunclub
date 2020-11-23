package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.mine.MyFollowActivity
import com.ds.worldfunclub.viewmodel.MyFollowModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/22 上午9:24
 */

@Module
class MyFollowModule(private val activity: MyFollowActivity) {

    @ActivityScope
    @Provides
    fun provideMyFollowModel(app: App, api: Api): MyFollowModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(MyFollowModel::class.java)

    }
}
