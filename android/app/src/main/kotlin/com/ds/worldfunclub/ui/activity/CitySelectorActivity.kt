package com.ds.worldfunclub.ui.activity

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.citySelector
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCitySelectorComponent
import com.ds.worldfunclub.di.module.CitySelectorModule
import com.ds.worldfunclub.viewmodel.CitySelectorModel

/**
 * @Author 12031
 * @Date 2020/8/19 12:36
 */
@Route(path = citySelector)
class CitySelectorActivity : BaseActivity<CitySelectorModel>() {
    override fun layoutId() = R.layout.activity_city_select

    override fun init(appComponent: AppComponent) {
        DaggerCitySelectorComponent.builder()
            .appComponent(appComponent)
            .citySelectorModule(CitySelectorModule(this))
            .build()
            .linked(this)
    }
}