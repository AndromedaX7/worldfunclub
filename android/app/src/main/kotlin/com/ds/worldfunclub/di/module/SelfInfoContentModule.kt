package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.user.SelfInfoContentActivity
import com.ds.worldfunclub.viewmodel.SelfInfoContentModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:24
 */

@Module
class SelfInfoContentModule(private val activity: SelfInfoContentActivity) {

    @ActivityScope
    @Provides
    fun provideSelfInfoContentModel(app: App, api: Api): SelfInfoContentModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SelfInfoContentModel::class.java)

    }
}
