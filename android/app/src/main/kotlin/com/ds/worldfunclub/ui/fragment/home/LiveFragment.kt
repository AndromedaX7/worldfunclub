package com.ds.worldfunclub.ui.fragment.home

import android.os.Bundle
import android.view.View
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerLiveFragmentComponent
import com.ds.worldfunclub.di.module.LiveFragmentModule
import com.ds.worldfunclub.ui.fragment.hometab.TabHomeFragment
import com.ds.worldfunclub.ui.fragment.livetab.LiveTabFragment
import com.ds.worldfunclub.viewmodel.LiveFragmentModel
import kotlinx.android.synthetic.main.fragment_live.*

/**
 * @Author 12031
 * @Date 2020/7/6 15:08
 */
class LiveFragment : BaseFragment<LiveFragmentModel>() {
    override fun layoutId() = R.layout.fragment_live

    override fun init(appComponent: AppComponent) {
        DaggerLiveFragmentComponent
            .builder()
            .appComponent(appComponent)
            .liveFragmentModule(LiveFragmentModule(this))
            .build()
            .linked(this)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        rxLifeScope.launch {
            val homeCategory = vm.api.homeCategory()
            if (homeCategory == null) {

            } else {
                val iterator = homeCategory.data.iterator()
                while (iterator.hasNext()) {
                    val next = iterator.next()
                    if (next.category_type == "1") {
                        iterator.remove()
                    }
                }
                if (homeCategory.code == 1) {
                    vm.homeAdapter.setData(ArrayList(homeCategory.data.map { LiveTabFragment(it) }))
                    vm.homeAdapter.titles.addAll(homeCategory.data.map {
                        it.name
                    })
                    vm.homeAdapter.updateFragment(0)
                    viewPager.adapter = vm.homeAdapter
                    tabLayout.setupWithViewPager(viewPager)
                }
            }
        }

    }
}