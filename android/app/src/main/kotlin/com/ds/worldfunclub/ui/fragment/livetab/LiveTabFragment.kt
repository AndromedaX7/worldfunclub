package com.ds.worldfunclub.ui.fragment.livetab

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerLiveTabFragmentComponent
import com.ds.worldfunclub.di.module.LiveTabFragmentModule
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.viewmodel.LiveTabModel

/**
 * @Author 12031
 * @Date 2020/7/8 9:13
 */
class LiveTabFragment(private val categoryData: HomeCategory.DataBean) :
    BaseFragment<LiveTabModel>() {
    override fun layoutId() = R.layout.fragment_live_category

    override fun init(appComponent: AppComponent) {
        DaggerLiveTabFragmentComponent.builder()
            .appComponent(appComponent)
            .liveTabFragmentModule(LiveTabFragmentModule(this))
            .build()
            .linked(this)
        vm.init(categoryData)
    }

}