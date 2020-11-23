package com.ds.worldfunclub.ui.delegate

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.recyclerview.widget.RecyclerView
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.evaluationPage
import com.ds.worldfunclub.app.orderDetails
import com.ds.worldfunclub.app.payOrder
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.databinding.ItemOrderGoodsBinding
import com.ds.worldfunclub.databinding.ItemOrderGoodsEvaluationBinding
import com.ds.worldfunclub.databinding.ItemOrderGoodsWillReceiveExpressBinding
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.network.OrderState.*
import com.ds.worldfunclub.responsebean.OrderList
import com.ds.worldfunclub.ui.CallGoodsDetails


abstract class AbsOrderDelegate(val needGoods: Boolean = true) :
    BindingDelegate2<OrderList.DataBean>(), CallGoodsDetails {
    override fun onBindViewHolder(
        viewHolder: RecyclerView.ViewHolder?,
        pos: Int,
        item: OrderList.DataBean?,
        dataSize: Int
    ) {
        super.onBindViewHolder(viewHolder, pos, item, dataSize)
        viewHolder?.let {

            val inflater = LayoutInflater.from(it.itemView.context)
            val root = it.itemView.findViewById<LinearLayout>(R.id.goods)
            root.removeAllViews()
            item?.let { g ->
                root.removeAllViews()
                for (i in 0 until g.goods.size) {


                    if (showEvaluation()) {
                        val items: ItemOrderGoodsEvaluationBinding = DataBindingUtil.inflate(
                            inflater,
                            R.layout.item_order_goods_evaluation,
                            root,
                            false
                        )
                        items.orderId = item.order_id
                        items.vm = this
                        items.goods = g.goods[i]
                        root.addView(items.root)
                    } else if (showExpress()) {
                        val items: ItemOrderGoodsWillReceiveExpressBinding =
                            DataBindingUtil.inflate(
                                inflater,
                                R.layout.item_order_goods_will_receive_express,
                                root,
                                false
                            )
                        items.orderId = item.order_id
                        items.vm = this
                        items.goods = g.goods[i]
                        root.addView(items.root)
                    } else {
                        val items: ItemOrderGoodsBinding = DataBindingUtil.inflate(
                            inflater,
                            R.layout.item_order_goods,
                            root,
                            false
                        )
                        items.vm = this
                        items.goods = g.goods[i]
                        root.addView(items.root)
                    }

                }

            }

            val rootState = it.itemView.findViewById<LinearLayout>(R.id.goodsState)
            rootState.removeAllViews()
            val state: ViewDataBinding =
                DataBindingUtil.inflate(inflater, stateLayout(), rootState, true)
            state.setVariable(BR.data, item)
            state.setVariable(BR.vm, this)

        }
    }

    override fun layoutId(): Int {
        return R.layout.item_order_wrap
    }

    abstract fun orderState(): String
    abstract fun stateLayout(): Int

    fun details(data: OrderList.DataBean, view: View) {
        ARouter.getInstance().build(orderDetails).withParcelable("data", data)
            .navigation(view.context)
    }

    open fun onPay(order: OrderList.DataBean, view: View) {
        ARouter.getInstance().build(payOrder).withString("orderId", order.order_id)
            .withString("pay", order.goods_money).navigation(view.context)
    }

    fun evaluation(orderId: String, goods: OrderList.DataBean.GoodsBean, view: View) {
        ARouter.getInstance().build(evaluationPage)
            .withString("orderId", orderId)
            .withString("goodsName", goods.goods_name)
            .withString("goodsImage", goods.image)
            .withString("goodsId", goods.goods_id).navigation(view.context)
    }

    fun evaluation(order: OrderList.DataBean, view: View) {
        ARouter.getInstance().build(evaluationPage)
            .withString("orderId", order.order_id)
            .withString("goodsName", order.goods[0].goods_name)
            .withString("goodsImage", order.goods[0].image)
            .withString("goodsId", order.goods[0].goods_id).navigation(view.context)
    }

    open fun express(view: View, orderId: String, orderGoodsId: String) {

    }

    open fun showEvaluation() = false
    open fun showExpress() = false
}

class OrderStateWillPay(needGoods: Boolean = true, val source: Boolean) :
    AbsOrderDelegate(needGoods) {
    override fun orderState(): String {
        return "待付款"
    }

    override fun onPay(order: OrderList.DataBean, view: View) {
        Log.e("hello", "hello")
        ARouter.getInstance().build(payOrder).withString("orderId", order.order_id)
            .withString("pay", order.goods_money)
            .withString("orderType", if (source) GoodsType.Self.value else GoodsType.Live.value)
            .navigation(view.context)
    }


    override fun stateLayout(): Int {
        return R.layout.item_order_state_willpay
    }

    override fun isForViewType(item: OrderList.DataBean?): Boolean {
        if (source) {
            return item != null && (item.order_status == WillPay.code)
        } else
            return item != null && (item.lh_order_status == WillPay.code)
    }
}


class OrderStateWillSend(needGoods: Boolean = true, val source: Boolean) :
    AbsOrderDelegate(needGoods) {
    override fun orderState(): String {
        return if (source) {
            "待发货"
        } else {
            "待使用"
        }
    }

    override fun stateLayout(): Int {
        return R.layout.item_order_state_willsend
    }

    override fun isForViewType(item: OrderList.DataBean?): Boolean {
        if (source)
            return item != null && (item.order_status == WillSend.code)
        else
            return item != null && (item.lh_order_status == WillSend.code)
    }
}

class OrderStateWillReceive(needGoods: Boolean = true, val source: Boolean) :
    AbsOrderDelegate(needGoods) {
    override fun orderState(): String {
        return if (source) {
            "待收货"
        } else {
            "已使用"
        }
    }

    override fun showExpress() = source

    override fun express(view: View, orderId: String, orderGoodsId: String) {
        ARouter.getInstance().build(com.ds.worldfunclub.app.express)
            .withString("orderId", orderId)
            .withString("goodsId", orderGoodsId)
            .navigation(view.context)
    }

    override fun stateLayout() =
        if (needGoods)
            R.layout.item_order_state_willsend
        else
            R.layout.item_order_state_willreceive

    override fun isForViewType(item: OrderList.DataBean?): Boolean {
        if (source)
            return item != null && (item.order_status == WillReceive.code)
        else
            return item != null && (item.lh_order_status == WillReceive.code)
    }

}

class OrderStateWillPingjia(needGoods: Boolean = true, val source: Boolean) :
    AbsOrderDelegate(needGoods) {
    override fun orderState(): String {
        return if (source) {
            "待评价"
        } else {
            "已过期"
        }
    }

    override fun stateLayout(): Int {
        return R.layout.item_order_state_willsend
    }

    override fun isForViewType(item: OrderList.DataBean?): Boolean {
        if (source) {
            return item != null && (item.order_status == WillEvaluation.code)
        } else
            return item != null && (item.lh_order_status == WillEvaluation.code)
    }

    override fun showEvaluation() = source
}
