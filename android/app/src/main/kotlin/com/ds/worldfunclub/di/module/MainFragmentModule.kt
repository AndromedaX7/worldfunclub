package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory3
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.ui.fragment.home.MainFragment
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.viewmodel.MainFragmentModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/6 15:19
 */

@Module
class MainFragmentModule(private val activity: MainFragment) {

    @FragmentScope
    @Provides
    fun provideMainFragmentModel(app: App, api: Api): MainFragmentModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory3(activity, app, api)
        ).get(MainFragmentModel::class.java)

    }
}