package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.SettingsActivity
import com.ds.worldfunclub.viewmodel.SettingsModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/18 上午10:43
 */

@Module
class SettingsModule(private val activity: SettingsActivity) {

    @ActivityScope
    @Provides
    fun provideSettingsModel(app: App, api: Api): SettingsModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SettingsModel::class.java)

    }
}
