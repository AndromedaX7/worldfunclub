package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.casual.CasualShopActivity
import com.ds.worldfunclub.viewmodel.CasualShopModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 12:56
 */

@Module
class CasualShopModule(private val activity: CasualShopActivity) {

    @ActivityScope
    @Provides
    fun provideCasualShopModel(app: App, api: Api): CasualShopModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(CasualShopModel::class.java)

    }
}