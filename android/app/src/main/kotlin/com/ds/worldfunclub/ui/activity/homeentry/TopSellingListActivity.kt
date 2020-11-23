package com.ds.worldfunclub.ui.activity.homeentry

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.topSellingListActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerTopSellingListComponent
import com.ds.worldfunclub.di.module.TopSellingListModule
import com.ds.worldfunclub.viewmodel.TopSellingListModel

/**
 * @Author 12031
 * @Date 2020/7/14 14:18
 */

@Route(path = topSellingListActivity)
class TopSellingListActivity : BaseActivity<TopSellingListModel>() {
    override fun layoutId() = R.layout.activity_active_entry_2

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerTopSellingListComponent.builder()
            .appComponent(appComponent)
            .topSellingListModule(TopSellingListModule(this))
            .build()
            .linked(this)
    }
    override fun onBackPressed() {
        finishAfterTransition()
    }
}
