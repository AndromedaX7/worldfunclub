package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.TabHomeFragmentModule
import com.ds.worldfunclub.ui.fragment.hometab.TabHomeFragment
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/8 9:18
 */


@FragmentScope
@Component(modules = [TabHomeFragmentModule::class], dependencies = [AppComponent::class])
interface TabHomeFragmentComponent {
    fun linked(activity: TabHomeFragment)
}
