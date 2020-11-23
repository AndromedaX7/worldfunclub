package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.ui.activity.SearchActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.viewmodel.SearchModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/8 11:08
 */

@Module
class SearchModule(private val activity: SearchActivity) {

    @ActivityScope
    @Provides
    fun provideSearchModel(app: App, api: Api): SearchModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SearchModel::class.java)

    }
}