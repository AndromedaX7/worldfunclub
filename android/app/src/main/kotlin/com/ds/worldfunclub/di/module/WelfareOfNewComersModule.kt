package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.homeentry.WelfareOfNewComersActivity
import com.ds.worldfunclub.viewmodel.WelfareOfNewComersModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/14 13:34
 */

@Module
class WelfareOfNewComersModule(private val activity: WelfareOfNewComersActivity) {

    @ActivityScope
    @Provides
    fun provideWelfareOfNewComersModel(app: App, api: Api): WelfareOfNewComersModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(WelfareOfNewComersModel::class.java)

    }
}