package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.goods.GoodsCategoryActivity
import com.ds.worldfunclub.viewmodel.GoodsCategoryModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/9 2:33
 */

@Module
class GoodsCategoryModule(private val activity: GoodsCategoryActivity) {

    @ActivityScope
    @Provides
    fun provideGoodsCategoryModel(app: App, api: Api): GoodsCategoryModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(GoodsCategoryModel::class.java)

    }
}