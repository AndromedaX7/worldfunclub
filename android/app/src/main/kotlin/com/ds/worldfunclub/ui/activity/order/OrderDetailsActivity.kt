package com.ds.worldfunclub.ui.activity.order

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.orderDetails
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerOrderDetailsComponent
import com.ds.worldfunclub.di.module.OrderDetailsModule
import com.ds.worldfunclub.responsebean.OrderList
import com.ds.worldfunclub.viewmodel.OrderDetailsModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午2:39
 */

@Route(path = orderDetails)
class OrderDetailsActivity : BaseActivity<OrderDetailsModel>() {
    override fun layoutId() = R.layout.activity_order_details

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.BLACK)
        DaggerOrderDetailsComponent.builder()
            .appComponent(appComponent)
            .orderDetailsModule(OrderDetailsModule(this))
            .build()
            .linked(this)
    }
    @Autowired
    @JvmField
    var data:OrderList.DataBean?=null
}
