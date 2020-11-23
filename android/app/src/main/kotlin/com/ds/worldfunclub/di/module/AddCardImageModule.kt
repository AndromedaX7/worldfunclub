package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.vip.AddCardImageActivity
import com.ds.worldfunclub.viewmodel.AddCardImageModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/25 下午2:36
 */

@Module
class AddCardImageModule(private val activity: AddCardImageActivity) {

    @ActivityScope
    @Provides
    fun provideAddCardImageModel(app: App, api: Api): AddCardImageModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(AddCardImageModel::class.java)

    }
}
