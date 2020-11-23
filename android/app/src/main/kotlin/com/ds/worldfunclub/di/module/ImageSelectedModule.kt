package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.ImageSelectedActivity
import com.ds.worldfunclub.viewmodel.ImageSelectedModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/16 15:39
 */

@Module
class ImageSelectedModule(private val activity: ImageSelectedActivity) {

    @ActivityScope
    @Provides
    fun provideImageSelectedModel(app: App, api: Api): ImageSelectedModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ImageSelectedModel::class.java)

    }
}