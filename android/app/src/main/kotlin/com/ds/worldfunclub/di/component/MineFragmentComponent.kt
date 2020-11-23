package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.MineFragmentModule
import com.ds.worldfunclub.ui.fragment.home.MineFragment
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/6 15:18
 */


@FragmentScope
@Component(modules = [MineFragmentModule::class], dependencies = [AppComponent::class])
interface MineFragmentComponent {
    fun linked(fragment: MineFragment)
}