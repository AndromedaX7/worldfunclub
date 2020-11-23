package com.ds.worldfunclub.ui.activity.order

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.orderSearch
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerOrderSearchComponent
import com.ds.worldfunclub.di.module.OrderSearchModule
import com.ds.worldfunclub.viewmodel.OrderSearchModel

/**
 * @Author mi
 * @Date 2020/8/19 9:57 AM
 */
@Route(path = orderSearch)
class OrderSearchActivity : BaseActivity<OrderSearchModel>() {
    override fun layoutId() = R.layout.activity_search_order

    override fun init(appComponent: AppComponent) {
        DaggerOrderSearchComponent.builder()
            .appComponent(appComponent)
            .orderSearchModule(OrderSearchModule(this))
            .build()
            .linked(this)
    }
}
