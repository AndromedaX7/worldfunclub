package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.merchant.WithdrawBusiActivity
import com.ds.worldfunclub.viewmodel.WithdrawBusiModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/15 13:53
 */

@Module
class WithdrawBusiModule(private val activity: WithdrawBusiActivity) {

    @ActivityScope
    @Provides
    fun provideWithdrawBusiModel(app: App, api: Api): WithdrawBusiModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(WithdrawBusiModel::class.java)

    }
}
