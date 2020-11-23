package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.base.ViewModelFactory3
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.fragment.goodsCategory.CategoryLastFragment
import com.ds.worldfunclub.viewmodel.CategoryLastFragmentModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/22 9:51
 */

@Module
class CategoryLastFragmentModule(private val activity: CategoryLastFragment) {

    @FragmentScope
    @Provides
    fun provideCategoryLastFragmentModel(app: App, api: Api): CategoryLastFragmentModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory3(activity, app, api)
        ).get(CategoryLastFragmentModel::class.java)

    }
}
