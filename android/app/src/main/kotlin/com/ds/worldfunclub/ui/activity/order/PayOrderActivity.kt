package com.ds.worldfunclub.ui.activity.order

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.payOrder
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerPayOrderComponent
import com.ds.worldfunclub.di.module.PayOrderModule
import com.ds.worldfunclub.viewmodel.PayOrderModel

/**
 * @Author miaom
 * @Date 2020/10/26 14:52
 */
@Route(path = payOrder)
class PayOrderActivity : BaseActivity<PayOrderModel>() {
    override fun layoutId() = R.layout.activity_pay_order

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerPayOrderComponent.builder()
            .appComponent(appComponent)
            .payOrderModule(PayOrderModule(this))
            .build()
            .linked(this)
    }

    @Autowired
    @JvmField
    var orderId =""
    @Autowired
    @JvmField
    var pay =""
    @Autowired
    @JvmField
    var orderType =""
}