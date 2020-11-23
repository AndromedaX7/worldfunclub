package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.homeentry.SigninActivity
import com.ds.worldfunclub.viewmodel.SigninModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/14 10:51
 */

@Module
class SigninModule(private val activity: SigninActivity) {

    @ActivityScope
    @Provides
    fun provideSigninModel(app: App, api: Api): SigninModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SigninModel::class.java)
    }
}