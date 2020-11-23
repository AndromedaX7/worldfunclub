package com.ds.worldfunclub.ui.activity

import android.graphics.Color
import android.os.Bundle
import android.util.Log
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.searchGlobal
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSearchComponent
import com.ds.worldfunclub.di.module.SearchModule
import com.ds.worldfunclub.viewmodel.SearchModel
import com.google.android.material.tabs.TabLayout
import kotlinx.android.synthetic.main.activity_search.*

/**
 * @Author 12031
 * @Date 2020/7/8 10:47
 */
@Route(path = searchGlobal)
class SearchActivity : BaseActivity<SearchModel>() {
    override fun layoutId() = R.layout.activity_search

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerSearchComponent.builder()
            .appComponent(appComponent)
            .searchModule(SearchModule(this))
            .build()
            .linked(this)


    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        tab.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabReselected(tab: TabLayout.Tab?) {
                if ("价格" == tab?.text) {
                    vm.changeSort()
                }
            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {
            }

            override fun onTabSelected(tab: TabLayout.Tab?) {
                when (tab?.text) {
                    "综合" -> vm.changeState(1)
                    "销量" -> vm.changeState(2)
                    "价格" -> vm.changeState(3)
                }

            }

        })
    }


    override fun onBackPressed() {
        finishAfterTransition()
    }
}
