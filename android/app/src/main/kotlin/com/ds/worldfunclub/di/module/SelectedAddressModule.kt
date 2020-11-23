package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.goods.SelectedAddressActivity
import com.ds.worldfunclub.viewmodel.SelectedAddressModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/15 9:37
 */

@Module
class SelectedAddressModule(private val activity: SelectedAddressActivity) {

    @ActivityScope
    @Provides
    fun provideSelectedAddressModel(app: App, api: Api): SelectedAddressModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SelectedAddressModel::class.java)

    }
}