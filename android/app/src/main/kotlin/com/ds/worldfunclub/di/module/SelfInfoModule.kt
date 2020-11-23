package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.user.SelfInfoActivity
import com.ds.worldfunclub.viewmodel.SelfInfoModel
import dagger.Module
import dagger.Provides

/**
 * @Author mi
 * @Date 2020/7/19 9:16 AM
 */

@Module
class SelfInfoModule(private val activity: SelfInfoActivity) {

    @ActivityScope
    @Provides
    fun provideSelfInfoModel(app: App, api: Api): SelfInfoModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SelfInfoModel::class.java)

    }
}