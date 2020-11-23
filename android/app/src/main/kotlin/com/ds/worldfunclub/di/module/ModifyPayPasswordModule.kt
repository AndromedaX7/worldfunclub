package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.security.ModifyPayPasswordActivity
import com.ds.worldfunclub.viewmodel.ModifyPayPasswordModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:12
 */

@Module
class ModifyPayPasswordModule(private val activity: ModifyPayPasswordActivity) {

    @ActivityScope
    @Provides
    fun provideModifyPayPasswordModel(app: App, api: Api): ModifyPayPasswordModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ModifyPayPasswordModel::class.java)

    }
}
