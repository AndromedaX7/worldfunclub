package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.ExpressActivity
import com.ds.worldfunclub.viewmodel.ExpressModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/11/3 14:13
 */

@Module
class ExpressModule(private val activity: ExpressActivity) {

    @ActivityScope
    @Provides
    fun provideExpressModel(app: App, api: Api): ExpressModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(ExpressModel::class.java)

    }
}
