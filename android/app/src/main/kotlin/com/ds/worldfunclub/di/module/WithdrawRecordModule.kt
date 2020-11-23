package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.vip.WithdrawRecordActivity
import com.ds.worldfunclub.viewmodel.WithdrawRecordModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午4:46
 */

@Module
class WithdrawRecordModule(private val activity: WithdrawRecordActivity) {

    @ActivityScope
    @Provides
    fun provideWithdrawRecordModel(app: App, api: Api): WithdrawRecordModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(WithdrawRecordModel::class.java)

    }
}
