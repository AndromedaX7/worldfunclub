package com.ds.worldfunclub.ui.fragment

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseFragment
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerOrderListFragmentComponent
import com.ds.worldfunclub.di.module.OrderListFragmentModule
import com.ds.worldfunclub.viewmodel.OrderListFragmentModel

/**
 * @Author miaom
 * @Date 2020/10/26 15:59
 */
class OrderListFragment : BaseFragment<OrderListFragmentModel>() {
    override fun layoutId() = R.layout.fragment_order_list

    override fun init(appComponent: AppComponent) {
        DaggerOrderListFragmentComponent.builder()
            .appComponent(appComponent)
            .orderListFragmentModule(OrderListFragmentModule(this))
            .build()
            .linked(this)
    }

    var pos = 0
    var source = 1

}