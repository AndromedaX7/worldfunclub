package com.ds.worldfunclub.ui.activity.live.casual

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.casualShop
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCasualShopComponent
import com.ds.worldfunclub.di.module.CasualShopModule
import com.ds.worldfunclub.viewmodel.CasualShopModel

/**
 * @Author 12031
 * @Date 2020/8/19 12:56
 */
@Route(path=casualShop)
class CasualShopActivity : BaseActivity<CasualShopModel>() {
    override fun layoutId() = R.layout.activity_casual

    override fun init(appComponent: AppComponent) {
        DaggerCasualShopComponent.builder()
            .appComponent(appComponent)
            .casualShopModule(CasualShopModule(this))
            .build()
            .linked(this)
    }
}