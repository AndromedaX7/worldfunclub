package com.ds.worldfunclub.ui.activity.live.hotel

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.hotelHome
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerHotelHomeComponent
import com.ds.worldfunclub.di.module.HotelHomeModule
import com.ds.worldfunclub.viewmodel.HotelHomeModel

/**
 * @Author 12031
 * @Date 2020/8/19 11:03
 */
@Route(path=hotelHome)
class HotelHomeActivity : BaseActivity<HotelHomeModel>() {
    override fun layoutId() =R.layout.activity_hotel_home

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerHotelHomeComponent.builder()
            .appComponent(appComponent)
            .hotelHomeModule(HotelHomeModule(this))
            .build()
            .linked(this)
    }
}