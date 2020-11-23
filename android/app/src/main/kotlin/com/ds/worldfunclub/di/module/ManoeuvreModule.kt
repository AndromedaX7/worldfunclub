package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.ManoeuvreActivity
import com.ds.worldfunclub.viewmodel.ManoeuvreModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/13 14:20
 */

@Module
class ManoeuvreModule(private val activity: ManoeuvreActivity) {

    @ActivityScope
    @Provides
    fun provideManoeuvreModel(app: App, api: Api): ManoeuvreModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ManoeuvreModel::class.java)

    }
}