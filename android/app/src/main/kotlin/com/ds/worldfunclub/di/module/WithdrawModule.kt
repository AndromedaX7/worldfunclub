package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.vip.WithdrawActivity
import com.ds.worldfunclub.viewmodel.WithdrawModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午3:04
 */

@Module
class WithdrawModule(private val activity: WithdrawActivity) {

    @ActivityScope
    @Provides
    fun provideWithdrawModel(app: App, api: Api): WithdrawModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(WithdrawModel::class.java)

    }
}
