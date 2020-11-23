package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.casual.CasualDetailsActivity
import com.ds.worldfunclub.viewmodel.CasualDetailsModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 12:51
 */

@Module
class CasualDetailsModule(private val activity: CasualDetailsActivity) {

    @ActivityScope
    @Provides
    fun provideCasualDetailsModel(app: App, api: Api): CasualDetailsModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(CasualDetailsModel::class.java)

    }
}