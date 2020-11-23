package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.PingjiaDetailsActivity
import com.ds.worldfunclub.viewmodel.PingjiaDetailsModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/10 14:36
 */

@Module
class PingjiaDetailsModule(private val activity: PingjiaDetailsActivity) {

    @ActivityScope
    @Provides
    fun providePingjiaDetailsModel(app: App, api: Api): PingjiaDetailsModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(PingjiaDetailsModel::class.java)

    }
}