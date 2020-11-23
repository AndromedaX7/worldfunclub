package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.ui.activity.MainActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.viewmodel.MainModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/4 14:38
 */

@Module
class MainModule(private val activity: MainActivity) {

    @ActivityScope
    @Provides
    fun provideMainModel(app: App, api: Api): MainModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(MainModel::class.java)

    }
}