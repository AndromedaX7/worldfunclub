package com.ds.worldfunclub.ui.fragment.home

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMineFragmentComponent
import com.ds.worldfunclub.di.module.MineFragmentModule
import com.ds.worldfunclub.viewmodel.MineFragmentModel

/**
 * @Author 12031
 * @Date 2020/7/6 15:08
 */
class MineFragment : BaseFragment<MineFragmentModel>() {
    override fun layoutId() = R.layout.fragment_mine

    override fun init(appComponent: AppComponent) {
        DaggerMineFragmentComponent
            .builder()
            .appComponent(appComponent)
            .mineFragmentModule(MineFragmentModule(this))
            .build()
            .linked(this)
    }
}