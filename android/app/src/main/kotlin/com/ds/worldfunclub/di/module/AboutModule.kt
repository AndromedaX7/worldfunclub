package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.about.AboutActivity
import com.ds.worldfunclub.viewmodel.AboutModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:31
 */

@Module
class AboutModule(private val activity: AboutActivity) {

    @ActivityScope
    @Provides
    fun provideAboutModel(app: App, api: Api): AboutModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(AboutModel::class.java)

    }
}
