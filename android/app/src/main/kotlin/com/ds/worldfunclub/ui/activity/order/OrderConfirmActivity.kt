package com.ds.worldfunclub.ui.activity.order

import android.app.AlertDialog
import android.graphics.Color
import android.text.TextUtils
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.orderConfirmActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerOrderConfirmComponent
import com.ds.worldfunclub.di.module.OrderConfirmModule
import com.ds.worldfunclub.responsebean.GoodsArr
import com.ds.worldfunclub.viewmodel.OrderConfirmModel

/**
 * @Author tachibanako
 * @Date 2020/7/15 下午4:21
 */
@Route(path = orderConfirmActivity)
class OrderConfirmActivity : BaseActivity<OrderConfirmModel>() {
    override fun layoutId() = R.layout.activity_order_confirm

    @Autowired
    @JvmField
    var goods: GoodsArr? = null

    @Autowired
    @JvmField
    var goodsAll: ArrayList<GoodsArr> = ArrayList()

    @Autowired
    @JvmField
    var self = ""

    @Autowired
    @JvmField
    var buyOne = false

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerOrderConfirmComponent.builder()
            .appComponent(appComponent)
            .orderConfirmModule(OrderConfirmModule(this))
            .build()
            .linked(this)
    }

    override fun onBackPressed() {

        if (TextUtils.isEmpty(vm.lastOrderId)) {
            super.onBackPressed()
        } else {
            val dialog = AlertDialog.Builder(this)
                .setTitle("去支付")
                .setCancelable(false)
                .setMessage("当前订单支付未完成，继续支付吗？")
                .setPositiveButton(
                    "去支付"
                ) { _, _ ->
                    vm.pay(vm.lastOrderId)
                    vm.lastOrderId = ""
                    vm.payChangeEnabled = true
                }
                .setNegativeButton("放弃支付") { _, _ ->
                    finish()
                }
                .create()
            dialog.show()
        }
    }
}
