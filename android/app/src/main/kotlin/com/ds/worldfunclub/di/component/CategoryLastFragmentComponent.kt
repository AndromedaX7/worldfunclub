package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.di.module.CategoryLastFragmentModule
import com.ds.worldfunclub.ui.fragment.goodsCategory.CategoryLastFragment
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/22 9:52
 */


@FragmentScope
@Component(modules = [CategoryLastFragmentModule::class], dependencies = [AppComponent::class])
interface CategoryLastFragmentComponent {
    fun linked(activity: CategoryLastFragment)
}
