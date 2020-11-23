package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory3
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.ui.fragment.hometab.TabOtherFragment
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.fragment.livetab.LiveTabFragment
import com.ds.worldfunclub.viewmodel.LiveTabModel
import com.ds.worldfunclub.viewmodel.TabOtherFragmentModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/8 9:18
 */

@Module
class LiveTabFragmentModule(private val activity: LiveTabFragment) {

    @FragmentScope
    @Provides
    fun provideLiveTabModel(app: App, api: Api): LiveTabModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory3(activity, app, api)
        ).get(LiveTabModel::class.java)

    }
}