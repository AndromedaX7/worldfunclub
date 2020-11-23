package com.ds.worldfunclub.ui.activity.live.hotel

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.hotelDetails
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerHotelDetailsComponent
import com.ds.worldfunclub.di.module.HotelDetailsModule
import com.ds.worldfunclub.viewmodel.HotelDetailsModel

/**
 * @Author 12031
 * @Date 2020/8/19 11:33
 */
@Route(path = hotelDetails)
class HotelDetailsActivity : BaseActivity<HotelDetailsModel>() {
    override fun layoutId() = R.layout.activity_hotel_details

    override fun init(appComponent: AppComponent) {
        DaggerHotelDetailsComponent.builder()
            .appComponent(appComponent)
            .hotelDetailsModule(HotelDetailsModule(this))
            .build()
            .linked(this)
    }
}