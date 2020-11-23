package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.homeentry.BrandSelectionActivity
import com.ds.worldfunclub.viewmodel.BrandSelectionModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/14 14:07
 */

@Module
class BrandSelectionModule(private val activity: BrandSelectionActivity) {

    @ActivityScope
    @Provides
    fun provideBrandSelectionModel(app: App, api: Api): BrandSelectionModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(BrandSelectionModel::class.java)

    }
}