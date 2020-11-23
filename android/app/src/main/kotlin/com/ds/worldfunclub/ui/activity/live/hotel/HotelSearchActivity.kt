package com.ds.worldfunclub.ui.activity.live.hotel

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.hotelSearch
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerHotelSearchComponent
import com.ds.worldfunclub.di.module.HotelSearchModule
import com.ds.worldfunclub.viewmodel.HotelSearchModel

/**
 * @Author 12031
 * @Date 2020/8/19 11:54
 */
@Route(path = hotelSearch)
class HotelSearchActivity : BaseActivity<HotelSearchModel>() {
    override fun layoutId() = R.layout.activity_hotal_search

    override fun init(appComponent: AppComponent) {
        DaggerHotelSearchComponent.builder()
            .appComponent(appComponent)
            .hotelSearchModule(HotelSearchModule(this))
            .build()
            .linked(this)
    }
}