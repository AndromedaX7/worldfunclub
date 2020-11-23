package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.mine.MyCollectionActivity
import com.ds.worldfunclub.viewmodel.MyCollectionModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/22 下午12:08
 */

@Module
class MyCollectionModule(private val activity: MyCollectionActivity) {

    @ActivityScope
    @Provides
    fun provideMyCollectionModel(app: App, api: Api): MyCollectionModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(MyCollectionModel::class.java)

    }
}
