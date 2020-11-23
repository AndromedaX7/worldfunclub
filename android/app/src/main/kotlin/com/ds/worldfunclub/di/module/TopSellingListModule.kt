package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.homeentry.TopSellingListActivity
import com.ds.worldfunclub.viewmodel.TopSellingListModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/14 14:19
 */

@Module
class TopSellingListModule(private val activity: TopSellingListActivity) {

    @ActivityScope
    @Provides
    fun provideTopSellingListModel(app: App, api: Api): TopSellingListModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(TopSellingListModel::class.java)

    }
}