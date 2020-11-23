package com.ds.worldfunclub.ui.fragment.home

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMainComponent
import com.ds.worldfunclub.di.component.DaggerMainFragmentComponent
import com.ds.worldfunclub.di.module.MainFragmentModule
import com.ds.worldfunclub.di.module.MainModule
import com.ds.worldfunclub.viewmodel.MainFragmentModel

/**
 * @Author 12031
 * @Date 2020/7/6 15:08
 */
class MainFragment : BaseFragment<MainFragmentModel>() {
    override fun layoutId() = R.layout.fragment_main

    override fun init(appComponent: AppComponent) {
        DaggerMainFragmentComponent
            . builder()
            .appComponent(appComponent)
            .mainFragmentModule(MainFragmentModule(this))
            .build()
            .linked(this)
    }


}