package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.homeentry.SpecialOfferActivity
import com.ds.worldfunclub.viewmodel.SpecialOfferModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/14 14:28
 */

@Module
class SpecialOfferModule(private val activity: SpecialOfferActivity) {

    @ActivityScope
    @Provides
    fun provideSpecialOfferModel(app: App, api: Api): SpecialOfferModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(SpecialOfferModel::class.java)

    }
}