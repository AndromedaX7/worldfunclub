package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.PaySuccessActivity
import com.ds.worldfunclub.viewmodel.PaySuccessModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/11/3 10:10
 */

@Module
class PaySuccessModule(private val activity: PaySuccessActivity) {

    @ActivityScope
    @Provides
    fun providePaySuccessModel(app: App, api: Api): PaySuccessModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(PaySuccessModel::class.java)

    }
}
