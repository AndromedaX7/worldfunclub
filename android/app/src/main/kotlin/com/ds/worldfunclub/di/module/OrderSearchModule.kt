package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.OrderSearchActivity
import com.ds.worldfunclub.viewmodel.OrderSearchModel
import dagger.Module
import dagger.Provides

/**
 * @Author mi
 * @Date 2020/8/19 9:59 AM
 */

@Module
class OrderSearchModule(private val activity: OrderSearchActivity) {

    @ActivityScope
    @Provides
    fun provideOrderSearchModel(app: App, api: Api): OrderSearchModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(OrderSearchModel::class.java)

    }
}