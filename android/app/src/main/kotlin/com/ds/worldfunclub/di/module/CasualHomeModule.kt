package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.casual.CasualHomeActivity
import com.ds.worldfunclub.viewmodel.CasualHomeModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 12:44
 */

@Module
class CasualHomeModule(private val activity: CasualHomeActivity) {

    @ActivityScope
    @Provides
    fun provideCasualHomeModel(app: App, api: Api): CasualHomeModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(CasualHomeModel::class.java)

    }
}