package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.goods.CartActivity
import com.ds.worldfunclub.viewmodel.CartModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/16 下午1:57
 */

@Module
class CartModule(private val activity: CartActivity) {

    @ActivityScope
    @Provides
    fun provideCartModel(app: App, api: Api): CartModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(CartModel::class.java)

    }
}
