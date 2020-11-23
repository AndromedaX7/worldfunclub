package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.delicicy.LiveDelicacyActivity
import com.ds.worldfunclub.viewmodel.LiveDelicacyModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/8/19 12:32
 */

@Module
class LiveDelicacyModule(private val activity: LiveDelicacyActivity) {

    @ActivityScope
    @Provides
    fun provideLiveDelicacyModel(app: App, api: Api): LiveDelicacyModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(LiveDelicacyModel::class.java)

    }
}