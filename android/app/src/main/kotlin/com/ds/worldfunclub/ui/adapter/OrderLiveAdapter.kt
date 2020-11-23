package com.ds.worldfunclub.ui.adapter

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.viewpager.widget.PagerAdapter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.databinding.ItemPageOrderLiveListBinding
import com.ds.worldfunclub.responsebean.OrderList
import com.ds.worldfunclub.ui.delegate.*
import com.ds.worldfunclub.viewmodel.OrderLiveListModel

class OrderLiveAdapter(val orderListModel: OrderLiveListModel) : PagerAdapter() {

    val adapter = arrayListOf<MultiTypeAdapter<OrderList.DataBean>>()

    init {
//        val a0 = MultiTypeAdapter<OrderList.DataBean>()
//        a0.addDelegate(OrderLiveStateWillPay())
//        a0.addDelegate(OrderLiveStateWillSend())
//        a0.addDelegate(OrderLiveStateWillReceive())
//        a0.addDelegate(OrderLiveStateWillPingjia())
//        adapter.add(a0)

        val a1 = MultiTypeAdapter<OrderList.DataBean>()
        a1.addDelegate(OrderStateWillPay(source = false))

        adapter.add(a1)

        val a2 = MultiTypeAdapter<OrderList.DataBean>()
        a2.addDelegate(OrderStateWillSend(source = false))

        adapter.add(a2)

        val a3 = MultiTypeAdapter<OrderList.DataBean>()
        a3.addDelegate(OrderStateWillReceive(source = false))

        adapter.add(a3)

        val a4 = MultiTypeAdapter<OrderList.DataBean>()
        a4.addDelegate(OrderStateWillPingjia(source = false))

        adapter.add(a4)
    }

    override fun instantiateItem(container: ViewGroup, position: Int): Any {
        val page: ItemPageOrderLiveListBinding = DataBindingUtil.inflate(
            LayoutInflater.from(container.context),
            R.layout.item_page_order_live_list,
            container,
            false
        )
        page.vm = this
        page.pos = position
        container.addView(page.root)
        return page.root
    }

    override fun destroyItem(container: ViewGroup, position: Int, `object`: Any) {
        container.removeView(`object` as View?)
    }

    override fun isViewFromObject(view: View, `object`: Any): Boolean {
        return view == `object`
    }

    override fun getCount(): Int {
        return adapter.size
    }

    fun updateOrder(position: Int, orderData: ArrayList<OrderList.DataBean>) {
        adapter[position].clear()
        adapter[position].addData2(orderData)
    }

    fun clear(position: Int) {
        adapter[position].clear()
    }

    fun clearAll() {
        for (i in adapter) {
            i.clear()
        }
    }

    fun append(position: Int, orderData: ArrayList<OrderList.DataBean>) {
        adapter[position].addData2(orderData)
    }
}