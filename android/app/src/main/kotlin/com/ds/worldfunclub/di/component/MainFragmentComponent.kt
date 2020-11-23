package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.MainFragmentModule
import com.ds.worldfunclub.ui.fragment.home.MainFragment
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/6 15:18
 */


@FragmentScope
@Component(modules = [MainFragmentModule::class], dependencies = [AppComponent::class])
interface MainFragmentComponent {
    fun linked(fragment: MainFragment)
}