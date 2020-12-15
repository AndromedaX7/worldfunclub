package com.ds.worldfunclub.ui.delegate

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import androidx.recyclerview.widget.RecyclerView
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.databinding.ItemOrderGoodsBinding
import com.ds.worldfunclub.databinding.ItemOrderGoodsEvaluationBinding
import com.ds.worldfunclub.databinding.ItemOrderGoodsWillReceiveExpressBinding
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
    }

    open fun onPay(order: OrderList.DataBean, view: View) {
    }

    fun evaluation(orderId: String, goods: OrderList.DataBean.GoodsBean, view: View) {
    }

    fun evaluation(order: OrderList.DataBean, view: View) {
    }

    open fun express(view: View, orderId: String, orderGoodsId: String) {

    }

    open fun showEvaluation() = false
    open fun showExpress() = false
}
