package com.ds.worldfunclub.ui.activity.homeentry

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.specialOfferActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSpecialOfferComponent
import com.ds.worldfunclub.di.module.SpecialOfferModule
import com.ds.worldfunclub.viewmodel.SpecialOfferModel

/**
 * @Author 12031
 * @Date 2020/7/14 14:25
 */

@Route(path = specialOfferActivity)
class SpecialOfferActivity : BaseActivity<SpecialOfferModel>() {
    override fun layoutId() = R.layout.activity_active_entry_3

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerSpecialOfferComponent.builder()
            .appComponent(appComponent)
            .specialOfferModule(SpecialOfferModule(this))
            .build()
            .linked(this)
    }

    override fun onBackPressed() {
        finishAfterTransition()
    }
}
