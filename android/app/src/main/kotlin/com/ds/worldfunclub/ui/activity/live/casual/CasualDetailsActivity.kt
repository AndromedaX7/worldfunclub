package com.ds.worldfunclub.ui.activity.live.casual

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.casualDetails
import com.ds.worldfunclub.app.casualShop
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCasualDetailsComponent
import com.ds.worldfunclub.di.module.CasualDetailsModule
import com.ds.worldfunclub.viewmodel.CasualDetailsModel

/**
 * @Author 12031
 * @Date 2020/8/19 12:51
 */

@Route(path= casualDetails)
class CasualDetailsActivity : BaseActivity<CasualDetailsModel>() {
    override fun layoutId() = R.layout.activity_casual_details

    override fun init(appComponent: AppComponent) {
        DaggerCasualDetailsComponent.builder()
            .appComponent(appComponent)
            .casualDetailsModule(CasualDetailsModule(this))
            .build()
            .linked(this)
    }
}