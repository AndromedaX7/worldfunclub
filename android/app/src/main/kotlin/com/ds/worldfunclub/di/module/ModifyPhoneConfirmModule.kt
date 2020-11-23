package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.security.ModifyPhoneConfirmActivity
import com.ds.worldfunclub.viewmodel.ModifyPhoneConfirmModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:40
 */

@Module
class ModifyPhoneConfirmModule(private val activity: ModifyPhoneConfirmActivity) {

    @ActivityScope
    @Provides
    fun provideModifyPhoneConfirmModel(app: App, api: Api): ModifyPhoneConfirmModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ModifyPhoneConfirmModel::class.java)

    }
}
