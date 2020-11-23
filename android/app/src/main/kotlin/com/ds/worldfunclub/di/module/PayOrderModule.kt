package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.PayOrderActivity
import com.ds.worldfunclub.viewmodel.PayOrderModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/26 14:53
 */

@Module
class PayOrderModule(private val activity: PayOrderActivity) {

    @ActivityScope
    @Provides
    fun providePayOrderModel(app: App, api: Api): PayOrderModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(PayOrderModel::class.java)

    }
}
