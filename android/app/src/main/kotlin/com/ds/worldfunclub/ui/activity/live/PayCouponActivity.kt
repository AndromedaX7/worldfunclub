package com.ds.worldfunclub.ui.activity.live

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.payCoupon
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerPayCouponComponent
import com.ds.worldfunclub.di.module.PayCouponModule
import com.ds.worldfunclub.viewmodel.PayCouponModel

/**
 * @Author mi
 * @Date 2020/8/19 10:20 AM
 */
@Route(path = payCoupon)
class PayCouponActivity : BaseActivity<PayCouponModel>() {
    override fun layoutId() = R.layout.activity_pay_coupon

    override fun init(appComponent: AppComponent) {
        DaggerPayCouponComponent.builder()
            .appComponent(appComponent)
            .payCouponModule(PayCouponModule(this))
            .build()
            .linked(this)
    }
}
