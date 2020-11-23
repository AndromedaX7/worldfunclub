package com.ds.worldfunclub.ui.fragment.home

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerClubFragmentComponent
import com.ds.worldfunclub.di.module.ClubFragmentModule
import com.ds.worldfunclub.viewmodel.ClubFragmentModel

/**
 * @Author 12031
 * @Date 2020/7/6 15:08
 */
class ClubFragment : BaseFragment<ClubFragmentModel>() {
    override fun layoutId() = R.layout.fragment_club

    override fun init(appComponent: AppComponent) {
        DaggerClubFragmentComponent
            . builder()
            .appComponent(appComponent)
            .clubFragmentModule(ClubFragmentModule(this))
            .build()
            .linked(this)
    }
}