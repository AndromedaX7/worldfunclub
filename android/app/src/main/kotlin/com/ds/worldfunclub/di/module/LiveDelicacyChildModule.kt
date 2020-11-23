package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.delicicy.LiveDelicacyChildActivity
import com.ds.worldfunclub.viewmodel.LiveDelicacyChildModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/28 上午10:10
 */

@Module
class LiveDelicacyChildModule(private val activity: LiveDelicacyChildActivity) {

    @ActivityScope
    @Provides
    fun provideLiveDelicacyChildModel(app: App, api: Api): LiveDelicacyChildModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(LiveDelicacyChildModel::class.java)

    }
}
