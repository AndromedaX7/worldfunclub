package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.CitySelectorActivity
import com.ds.worldfunclub.viewmodel.CitySelectorModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 12:37
 */

@Module
class CitySelectorModule(private val activity: CitySelectorActivity) {

    @ActivityScope
    @Provides
    fun provideCitySelectorModel(app: App, api: Api): CitySelectorModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(CitySelectorModel::class.java)

    }
}