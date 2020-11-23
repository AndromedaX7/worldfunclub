package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.security.ModifyPhoneActivity
import com.ds.worldfunclub.viewmodel.ModifyPhoneModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:05
 */

@Module
class ModifyPhoneModule(private val activity: ModifyPhoneActivity) {

    @ActivityScope
    @Provides
    fun provideModifyPhoneModel(app: App, api: Api): ModifyPhoneModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ModifyPhoneModel::class.java)

    }
}
