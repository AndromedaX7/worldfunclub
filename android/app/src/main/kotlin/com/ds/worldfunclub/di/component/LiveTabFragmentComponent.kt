package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.LiveTabFragmentModule
import com.ds.worldfunclub.di.module.TabOtherFragmentModule
import com.ds.worldfunclub.ui.fragment.hometab.TabOtherFragment
import com.ds.worldfunclub.ui.fragment.livetab.LiveTabFragment
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/8 9:18
 */


@FragmentScope
@Component(modules = [LiveTabFragmentModule::class], dependencies = [AppComponent::class])
interface LiveTabFragmentComponent {
    fun linked(activity: LiveTabFragment)
}
