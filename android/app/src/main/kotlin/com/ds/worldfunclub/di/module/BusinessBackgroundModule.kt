package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.merchant.BusinessBackgroundActivity
import com.ds.worldfunclub.viewmodel.BusinessBackgroundModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/14 16:13
 */

@Module
class BusinessBackgroundModule(private val activity: BusinessBackgroundActivity) {

    @ActivityScope
    @Provides
    fun provideBusinessBackgroundModel(app: App, api: Api): BusinessBackgroundModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(BusinessBackgroundModel::class.java)

    }
}
