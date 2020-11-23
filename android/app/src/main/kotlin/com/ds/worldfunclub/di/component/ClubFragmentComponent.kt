package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.ClubFragmentModule
import com.ds.worldfunclub.ui.fragment.home.ClubFragment
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/6 15:18
 */


@FragmentScope
@Component(modules = [ClubFragmentModule::class], dependencies = [AppComponent::class])
interface ClubFragmentComponent {
    fun linked(fragment: ClubFragment)
}