package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.ShopListActivity
import com.ds.worldfunclub.viewmodel.ShopListModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/29 下午3:16
 */

@Module
class ShopListModule(private val activity: ShopListActivity) {

    @ActivityScope
    @Provides
    fun provideShopListModel(app: App, api: Api): ShopListModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ShopListModel::class.java)

    }
}
