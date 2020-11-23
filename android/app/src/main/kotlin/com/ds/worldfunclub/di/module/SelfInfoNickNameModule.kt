package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.user.SelfInfoNickNameActivity
import com.ds.worldfunclub.viewmodel.SelfInfoNickNameModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:42
 */

@Module
class SelfInfoNickNameModule(private val activity: SelfInfoNickNameActivity) {

    @ActivityScope
    @Provides
    fun provideSelfInfoNickNameModel(app: App, api: Api): SelfInfoNickNameModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SelfInfoNickNameModel::class.java)

    }
}
