package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.AftermarketActivity
import com.ds.worldfunclub.viewmodel.AftermarketModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/22 上午10:18
 */

@Module
class AftermarketModule(private val activity: AftermarketActivity) {

    @ActivityScope
    @Provides
    fun provideAftermarketModel(app: App, api: Api): AftermarketModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(AftermarketModel::class.java)

    }
}
