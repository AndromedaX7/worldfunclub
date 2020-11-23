package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.OrderLiveListActivity
import com.ds.worldfunclub.viewmodel.OrderLiveListModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/24 16:18
 */

@Module
class OrderLiveListModule(private val activity: OrderLiveListActivity) {

    @ActivityScope
    @Provides
    fun provideOrderLiveListModel(app: App, api: Api): OrderLiveListModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(OrderLiveListModel::class.java)

    }
}
