package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory3
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.ui.fragment.home.MineFragment
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.viewmodel.MineFragmentModel
import dagger.Module
import dagger.Provides

/**
 * @Author 12031
 * @Date 2020/7/6 15:19
 */

@Module
class MineFragmentModule(private val fragment: MineFragment) {

    @FragmentScope
    @Provides
    fun provideMainFragmentModel(app: App, api: Api): MineFragmentModel {
        return ViewModelProvider(
            fragment,
            ViewModelFactory3(fragment, app, api)
        ).get(MineFragmentModel::class.java)

    }
}