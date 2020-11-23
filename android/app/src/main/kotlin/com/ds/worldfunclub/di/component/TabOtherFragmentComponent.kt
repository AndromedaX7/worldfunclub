package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.TabOtherFragmentModule
import com.ds.worldfunclub.ui.fragment.hometab.TabOtherFragment
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/8 9:18
 */


@FragmentScope
@Component(modules = [TabOtherFragmentModule::class], dependencies = [AppComponent::class])
interface TabOtherFragmentComponent {
    fun linked(activity: TabOtherFragment)
}
