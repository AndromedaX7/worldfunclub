package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.MessageCenterActivity
import com.ds.worldfunclub.viewmodel.MessageCenterModel
import dagger.Module
import dagger.Provides

/**
 * @Author tachibanako
 * @Date 2020/7/13 下午1:42
 */

@Module

class MessageCenterModule(private val activity: MessageCenterActivity) {

    @ActivityScope
    @Provides
    fun provideMessageCenterModel(app: App, api: Api): MessageCenterModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(MessageCenterModel::class.java)

    }
}
