package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.delicicy.DelicacyDetailsActivity
import com.ds.worldfunclub.viewmodel.DelicicyDetailsModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/21 11:46
 */

@Module
class DelicicyDetailsModule(private val activity: DelicacyDetailsActivity) {

    @ActivityScope
    @Provides
    fun provideDelicicyDetailsModel(app: App, api: Api): DelicicyDetailsModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(DelicicyDetailsModel::class.java)

    }
}
