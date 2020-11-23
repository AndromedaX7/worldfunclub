package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.mine.BalanceActivity
import com.ds.worldfunclub.viewmodel.BalanceModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午1:54
 */

@Module
class BalanceModule(private val activity: BalanceActivity) {

    @ActivityScope
    @Provides
    fun provideBalanceModel(app: App, api: Api): BalanceModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(BalanceModel::class.java)

    }
}
