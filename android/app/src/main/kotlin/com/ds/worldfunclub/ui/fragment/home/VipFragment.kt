package com.ds.worldfunclub.ui.fragment.home

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerVipFragmentComponent
import com.ds.worldfunclub.di.module.VipFragmentModule
import com.ds.worldfunclub.viewmodel.VipFragmentModel

/**
 * @Author 12031
 * @Date 2020/7/6 15:08
 */
class VipFragment : BaseFragment<VipFragmentModel>() {
    override fun layoutId() = R.layout.fragment_vip

    override fun init(appComponent: AppComponent) {
        DaggerVipFragmentComponent
            . builder()
            .appComponent(appComponent)
            .vipFragmentModule(VipFragmentModule(this))
            .build()
            .linked(this)
    }
}