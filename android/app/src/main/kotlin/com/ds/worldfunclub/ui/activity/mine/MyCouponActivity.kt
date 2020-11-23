package com.ds.worldfunclub.ui.activity.mine

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.myCoupon
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMyCouponComponent
import com.ds.worldfunclub.di.module.MyCouponModule
import com.ds.worldfunclub.viewmodel.MyCouponModel

/**
 * @Author nekoneko
 * @Date 2020/7/23 上午9:46
 */
@Route(path = myCoupon)
class MyCouponActivity : BaseActivity<MyCouponModel>() {
    override fun layoutId() =R.layout.activity_my_coupon

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerMyCouponComponent.builder()
            .appComponent(appComponent)
            .myCouponModule(MyCouponModule(this))
            .build()
            .linked(this)
    }
}