package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.VipFragmentModule
import com.ds.worldfunclub.ui.fragment.home.VipFragment
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/6 15:18
 */


@FragmentScope
@Component(modules = [VipFragmentModule::class], dependencies = [AppComponent::class])
interface VipFragmentComponent {
    fun linked(fragment: VipFragment)
}