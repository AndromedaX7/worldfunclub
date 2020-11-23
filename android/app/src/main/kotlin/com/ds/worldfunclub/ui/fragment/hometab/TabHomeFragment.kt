package com.ds.worldfunclub.ui.fragment.hometab

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerTabHomeFragmentComponent
import com.ds.worldfunclub.di.module.TabHomeFragmentModule
import com.ds.worldfunclub.viewmodel.TabHomeFragmentModel

/**
 * @Author 12031
 * @Date 2020/7/8 9:13
 */
class TabHomeFragment : BaseFragment<TabHomeFragmentModel>() {
    override fun layoutId() = R.layout.fragment_home_category

    override fun init(appComponent: AppComponent) {
        DaggerTabHomeFragmentComponent.builder()
            .appComponent(appComponent)
            .tabHomeFragmentModule(TabHomeFragmentModule(this))
            .build()
            .linked(this)
    }

    override fun notifyInitData() {
        super.notifyInitData()
        vm.notifyInitData()
    }

    override fun broadcast() {
        super.broadcast()
        vm.broadcast()
    }
}