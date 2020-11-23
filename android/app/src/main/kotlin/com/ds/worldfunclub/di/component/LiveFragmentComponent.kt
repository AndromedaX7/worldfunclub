package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.LiveFragmentModule
import com.ds.worldfunclub.ui.fragment.home.LiveFragment
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/6 15:18
 */


@FragmentScope
@Component(modules = [LiveFragmentModule::class], dependencies = [AppComponent::class])
interface LiveFragmentComponent {
    fun linked(fragment: LiveFragment)
}