package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.OrderDetailsActivity
import com.ds.worldfunclub.viewmodel.OrderDetailsModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午2:39
 */

@Module
class OrderDetailsModule(private val activity: OrderDetailsActivity) {

    @ActivityScope
    @Provides
    fun provideOrderDetailsModel(app: App, api: Api): OrderDetailsModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(OrderDetailsModel::class.java)

    }
}
