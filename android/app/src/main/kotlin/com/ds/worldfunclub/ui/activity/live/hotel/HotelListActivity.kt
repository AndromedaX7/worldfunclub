package com.ds.worldfunclub.ui.activity.live.hotel

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.hotelList
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerHotelListComponent
import com.ds.worldfunclub.di.module.HotelListModule
import com.ds.worldfunclub.viewmodel.HotelListModel

/**
 * @Author 12031
 * @Date 2020/8/19 12:08
 */
@Route(path = hotelList)
class HotelListActivity : BaseActivity<HotelListModel>() {
    override fun layoutId() =R.layout.activity_hotal_list

    override fun init(appComponent: AppComponent) {
        DaggerHotelListComponent.builder()
            .appComponent(appComponent)
            .hotelListModule(HotelListModule(this))
            .build()
            .linked(this)
    }
}