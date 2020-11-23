package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.security.AccountAndSecurityActivity
import com.ds.worldfunclub.viewmodel.AccountAndSecurityModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:53
 */

@Module
class AccountAndSecurityModule(private val activity: AccountAndSecurityActivity) {

    @ActivityScope
    @Provides
    fun provideAccountAndSecurityModel(app: App, api: Api): AccountAndSecurityModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(AccountAndSecurityModel::class.java)

    }
}
