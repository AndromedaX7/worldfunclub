package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.OrderListFragmentModule
import com.ds.worldfunclub.ui.fragment.OrderListFragment
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/26 16:00
 */


@FragmentScope
@Component(modules = [OrderListFragmentModule::class], dependencies = [AppComponent::class])
interface OrderListFragmentComponent {
    fun linked(activity: OrderListFragment)
}
