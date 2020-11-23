package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.login.LoginActivity
import com.ds.worldfunclub.viewmodel.LoginModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/25 下午3:52
 */

@Module
class LoginModule(private val activity: LoginActivity) {

    @ActivityScope
    @Provides
    fun provideLoginModel(app: App, api: Api): LoginModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(LoginModel::class.java)

    }
}
