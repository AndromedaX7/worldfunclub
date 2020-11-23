package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.mine.MyFootprintActivity
import com.ds.worldfunclub.viewmodel.MyFootprintModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/29 上午9:21
 */

@Module
class MyFootprintModule(private val activity: MyFootprintActivity) {

    @ActivityScope
    @Provides
    fun provideMyFootprintModel(app: App, api: Api): MyFootprintModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(MyFootprintModel::class.java)

    }
}
