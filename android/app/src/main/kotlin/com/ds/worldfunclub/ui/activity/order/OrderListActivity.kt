package com.ds.worldfunclub.ui.activity.order

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.orderList
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerOrderListComponent
import com.ds.worldfunclub.di.module.OrderListModule
import com.ds.worldfunclub.viewmodel.OrderListModel

/**
 * @Author mi
 * @Date 2020/7/20 4:20 PM
 */

@Route(path = orderList)
class OrderListActivity : BaseActivity<OrderListModel>() {



    @JvmField
    @Autowired
    var state=0

    override fun layoutId() = R.layout.activity_order_list

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerOrderListComponent.builder()
            .appComponent(appComponent)
            .orderListModule(OrderListModule(this))
            .build()
            .linked(this)
    }

//    override fun needChangeGlobalStyle()=true
//    override fun needChangeStatusColor()=true
//    override fun statusBarColor(): Int {
//        return skinColor(R.color.colorToolbar)
//    }
}
