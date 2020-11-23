package com.ds.worldfunclub.ui.activity.order

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.paySuccess
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerPaySuccessComponent
import com.ds.worldfunclub.di.module.PaySuccessModule
import com.ds.worldfunclub.viewmodel.PaySuccessModel

/**
 * @Author miaom
 * @Date 2020/11/3 10:09
 */
@Route(path = paySuccess)
class PaySuccessActivity : BaseActivity<PaySuccessModel>() {
    override fun layoutId() = R.layout.activity_pay_success

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerPaySuccessComponent.builder()
            .appComponent(appComponent)
            .paySuccessModule(PaySuccessModule(this))
            .build()
            .linked(this)
    }


    @Autowired
    @JvmField
    var orderId = ""

    @Autowired
    @JvmField
    var orderType = ""

    @Autowired
    @JvmField
    var pay = ""

}
