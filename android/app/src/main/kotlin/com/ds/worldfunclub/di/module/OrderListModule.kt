package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.OrderListActivity
import com.ds.worldfunclub.viewmodel.OrderListModel
import dagger.Module
import dagger.Provides

/**
 * @Author mi
 * @Date 2020/7/20 4:21 PM
 */

@Module
class OrderListModule(private val activity: OrderListActivity) {

    @ActivityScope
    @Provides
    fun provideOrderListModel(app: App, api: Api): OrderListModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(OrderListModel::class.java)

    }
}