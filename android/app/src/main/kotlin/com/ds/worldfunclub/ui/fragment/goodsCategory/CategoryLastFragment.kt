package com.ds.worldfunclub.ui.fragment.goodsCategory

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCategoryLastFragmentComponent
import com.ds.worldfunclub.di.module.CategoryLastFragmentModule
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.viewmodel.CategoryLastFragmentModel

/**
 * @Author miaom
 * @Date 2020/10/22 9:50
 */
class CategoryLastFragment (val category:HomeCategory.DataBean.ChildBean): BaseFragment<CategoryLastFragmentModel>() {
    override fun layoutId() =R.layout.fragment_category_list

    override fun init(appComponent: AppComponent) {
        DaggerCategoryLastFragmentComponent.builder()
            .appComponent(appComponent)
            .categoryLastFragmentModule(CategoryLastFragmentModule(this))
            .build()
            .linked(this)
    }
}