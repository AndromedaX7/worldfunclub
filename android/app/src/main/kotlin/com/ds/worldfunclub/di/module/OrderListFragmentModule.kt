package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.base.ViewModelFactory3
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.fragment.OrderListFragment
import com.ds.worldfunclub.viewmodel.OrderListFragmentModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/26 16:01
 */

@Module
class OrderListFragmentModule(private val activity: OrderListFragment) {

    @FragmentScope
    @Provides
    fun provideOrderListFragmentModel(app: App, api: Api): OrderListFragmentModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory3(activity, app, api)
        ).get(OrderListFragmentModel::class.java)

    }
}
