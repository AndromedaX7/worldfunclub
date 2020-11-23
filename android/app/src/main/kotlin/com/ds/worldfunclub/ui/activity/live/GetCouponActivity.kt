package com.ds.worldfunclub.ui.activity.live

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.getCoupon
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerGetCouponComponent
import com.ds.worldfunclub.di.module.GetCouponModule
import com.ds.worldfunclub.viewmodel.GetCouponModel

/**
 * @Author 12031
 * @Date 2020/8/19 12:23
 */
@Route(path = getCoupon)
class GetCouponActivity : BaseActivity<GetCouponModel>() {
    override fun layoutId(): Int {
        val activityGetCoupon = R.layout.activity_get_coupon
        return activityGetCoupon
    }

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerGetCouponComponent.builder()
            .appComponent(appComponent)
            .getCouponModule(GetCouponModule(this))
            .build()
            .linked(this)
    }
}