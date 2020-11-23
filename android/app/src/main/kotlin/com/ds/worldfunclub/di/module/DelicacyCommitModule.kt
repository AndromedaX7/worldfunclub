package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.DelicacyCommitActivity
import com.ds.worldfunclub.viewmodel.DelicacyCommitModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/22 16:56
 */

@Module
class DelicacyCommitModule(private val activity: DelicacyCommitActivity) {

    @ActivityScope
    @Provides
    fun provideDelicacyCommitModel(app: App, api: Api): DelicacyCommitModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(DelicacyCommitModel::class.java)

    }
}
