package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.OrderConfirmActivity
import com.ds.worldfunclub.viewmodel.OrderConfirmModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/15 下午4:22
 */

@Module
class OrderConfirmModule(private val activity: OrderConfirmActivity) {

    @ActivityScope
    @Provides
    fun provideOrderConfirmModel(app: App, api: Api): OrderConfirmModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(OrderConfirmModel::class.java)

    }
}
