package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.security.SystemPermissionActivity
import com.ds.worldfunclub.viewmodel.SystemPermissionModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午11:52
 */

@Module
class SystemPermissionModule(private val activity: SystemPermissionActivity) {

    @ActivityScope
    @Provides
    fun provideSystemPermissionModel(app: App, api: Api): SystemPermissionModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SystemPermissionModel::class.java)

    }
}
