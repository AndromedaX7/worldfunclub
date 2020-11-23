package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.login.LoginPhoneActivity
import com.ds.worldfunclub.viewmodel.LoginPhoneModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/8/21 下午2:39
 */

@Module
class LoginPhoneModule(private val activity: LoginPhoneActivity) {

    @ActivityScope
    @Provides
    fun provideLoginPhoneModel(app: App, api: Api): LoginPhoneModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(LoginPhoneModel::class.java)

    }
}