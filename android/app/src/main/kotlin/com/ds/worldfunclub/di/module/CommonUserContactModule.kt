package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.commonuser.CommonUserContactActivity
import com.ds.worldfunclub.viewmodel.CommonUserContactModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:18
 */

@Module
class CommonUserContactModule(private val activity: CommonUserContactActivity) {

    @ActivityScope
    @Provides
    fun provideCommonUserContactModel(app: App, api: Api): CommonUserContactModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(CommonUserContactModel::class.java)

    }
}
