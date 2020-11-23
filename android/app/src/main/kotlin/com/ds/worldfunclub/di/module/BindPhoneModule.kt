package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.login.BindPhoneActivity
import com.ds.worldfunclub.viewmodel.BindPhoneModel
import dagger.Module
import dagger.Provides

/**
 * @Author mi
 * @Date 2020/8/19 3:23 PM
 */

@Module
class BindPhoneModule(private val activity: BindPhoneActivity) {

    @ActivityScope
    @Provides
    fun provideBindPhoneModel(app: App, api: Api): BindPhoneModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(BindPhoneModel::class.java)

    }
}