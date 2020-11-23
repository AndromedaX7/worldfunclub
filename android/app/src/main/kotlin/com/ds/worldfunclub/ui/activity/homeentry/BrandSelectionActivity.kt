package com.ds.worldfunclub.ui.activity.homeentry

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.brandSelectionActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerBrandSelectionComponent
import com.ds.worldfunclub.di.module.BrandSelectionModule
import com.ds.worldfunclub.viewmodel.BrandSelectionModel

/**
 * @Author 12031
 * @Date 2020/7/14 14:06
 */

@Route(path = brandSelectionActivity)
class BrandSelectionActivity : BaseActivity<BrandSelectionModel>() {
    override fun layoutId() = R.layout.activity_active_entry_1

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerBrandSelectionComponent.builder()
            .appComponent(appComponent)
            .brandSelectionModule(BrandSelectionModule(this))
            .build()
            .linked(this)
    }

    override fun onBackPressed() {
        finishAfterTransition()
    }
}
