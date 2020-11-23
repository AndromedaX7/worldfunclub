package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.goods.ShopDetailsActivity
import com.ds.worldfunclub.viewmodel.ShopDetailsModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/15 11:01
 */

@Module
class ShopDetailsModule(private val activity: ShopDetailsActivity) {

    @ActivityScope
    @Provides
    fun provideShopDetailsModel(app: App, api: Api): ShopDetailsModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ShopDetailsModel::class.java)

    }
}