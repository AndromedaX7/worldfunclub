package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.merchant.WriteOffActivity
import com.ds.worldfunclub.viewmodel.WriteOffModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/14 16:14
 */

@Module
class WriteOffModule(private val activity: WriteOffActivity) {

    @ActivityScope
    @Provides
    fun provideWriteOffModel(app: App, api: Api): WriteOffModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(WriteOffModel::class.java)

    }
}
