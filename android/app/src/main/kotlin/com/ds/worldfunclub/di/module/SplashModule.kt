package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.ui.activity.SplashActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.viewmodel.SplashModel
import dagger.Module
import dagger.Provides

/**
 * @Authod 12031
 * @Date 2020/7/4 11:01
 */

@Module
class SplashModule(private val activity: SplashActivity) {

    @ActivityScope
    @Provides
    fun provideSplashModel(app: App, api: Api): SplashModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SplashModel::class.java)

    }
}