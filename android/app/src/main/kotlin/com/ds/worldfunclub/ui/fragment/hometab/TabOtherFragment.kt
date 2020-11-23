package com.ds.worldfunclub.ui.fragment.hometab

import android.os.Bundle
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerTabOtherFragmentComponent
import com.ds.worldfunclub.di.module.TabOtherFragmentModule
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.viewmodel.TabOtherFragmentModel

/**
 * @Author 12031
 * @Date 2020/7/8 9:13
 */
class TabOtherFragment :
    BaseFragment<TabOtherFragmentModel>() {
    override fun layoutId() = R.layout.fragment_other_category

    override fun init(appComponent: AppComponent) {
        DaggerTabOtherFragmentComponent.builder()
            .appComponent(appComponent)
            .tabOtherFragmentModule(TabOtherFragmentModule(this))
            .build()
            .linked(this)
        vm.init(categoryId,categoryData)
    }

    override fun notifyInitData() {
        super.notifyInitData()
        vm.notifyInitData()
    }

    override fun broadcast() {
        super.broadcast()
        vm.broadcast()
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("cid", categoryId)
        outState.putParcelableArrayList("children", categoryData)
    }

    override fun onViewStateRestored(savedInstanceState: Bundle?) {
        super.onViewStateRestored(savedInstanceState)
        if (savedInstanceState == null) {
            return
        } else {
            val parcelableArrayList =
                savedInstanceState.getParcelableArrayList<HomeCategory.DataBean.ChildBean>("children")

            if (parcelableArrayList != null) {
                this.categoryData.clear();
                this.categoryData.addAll( parcelableArrayList)
            }
            categoryId = savedInstanceState.getString("cid") ?: ""
        }
    }


    fun setCategory(categoryData: HomeCategory.DataBean): TabOtherFragment {
        this.categoryId = categoryData.category_id
        this.categoryData.clear();
        this.categoryData.addAll(categoryData.child)
        return this
    }

    private var categoryId: String = ""
    private var categoryData: ArrayList<HomeCategory.DataBean.ChildBean> = ArrayList()
}