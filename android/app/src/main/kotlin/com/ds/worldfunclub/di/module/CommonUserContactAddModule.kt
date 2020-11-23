package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.commonuser.CommonUserContactAddActivity
import com.ds.worldfunclub.viewmodel.CommonUserContactAddModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:21
 */

@Module
class CommonUserContactAddModule(private val activity: CommonUserContactAddActivity) {

    @ActivityScope
    @Provides
    fun provideCommonUserContactAddModel(app: App, api: Api): CommonUserContactAddModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(CommonUserContactAddModel::class.java)

    }
}
