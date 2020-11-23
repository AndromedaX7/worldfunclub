package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.goods.CategoryGoodsLastActivity
import com.ds.worldfunclub.viewmodel.CategoryGoodsLastModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/21 16:30
 */

@Module
class CategoryGoodsLastModule(private val activity: CategoryGoodsLastActivity) {

    @ActivityScope
    @Provides
    fun provideCategoryGoodsLastModel(app: App, api: Api): CategoryGoodsLastModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(CategoryGoodsLastModel::class.java)

    }
}
