package com.ds.worldfunclub.ui.activity.live.hotel

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.hotelCommit
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerHotelOrderCommitComponent
import com.ds.worldfunclub.di.module.HotelOrderCommitModule
import com.ds.worldfunclub.viewmodel.HotelOrderCommitModel

/**
 * @Author 12031
 * @Date 2020/8/19 11:49
 */
@Route(path = hotelCommit)
class HotelOrderCommitActivity : BaseActivity<HotelOrderCommitModel>() {
    override fun layoutId() =  R.layout.activity_hotel_commit

    override fun init(appComponent: AppComponent) {
        DaggerHotelOrderCommitComponent.builder()
            .appComponent(appComponent)
            .hotelOrderCommitModule(HotelOrderCommitModule(this))
            .build()
            .linked(this)
    }
}