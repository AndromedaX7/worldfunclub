package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.security.ModifyPayPasswordConfirmActivity
import com.ds.worldfunclub.viewmodel.ModifyPayPasswordConfirmModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:33
 */

@Module
class ModifyPayPasswordConfirmModule(private val activity: ModifyPayPasswordConfirmActivity) {

    @ActivityScope
    @Provides
    fun provideModifyPayPasswordConfirmModel(app: App, api: Api): ModifyPayPasswordConfirmModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ModifyPayPasswordConfirmModel::class.java)

    }
}
