package com.ds.worldfunclub.ui.activity.order

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.orderListLive
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerOrderLiveListComponent
import com.ds.worldfunclub.di.module.OrderLiveListModule
import com.ds.worldfunclub.viewmodel.OrderLiveListModel

/**
 * @Author miaom
 * @Date 2020/10/24 16:18
 */
@Route(path = orderListLive)
class OrderLiveListActivity : BaseActivity<OrderLiveListModel>() {

    override fun layoutId() = R.layout.activity_live_order_list

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerOrderLiveListComponent.builder()
            .appComponent(appComponent)
            .orderLiveListModule(OrderLiveListModule(this))
            .build()
            .linked(this)
    }


    @JvmField
    @Autowired
    var state = 0


}