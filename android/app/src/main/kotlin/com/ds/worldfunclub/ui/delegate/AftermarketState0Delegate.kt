package com.ds.worldfunclub.ui.delegate

import android.view.LayoutInflater
import android.widget.LinearLayout
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.RecyclerView
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.databinding.ItemOrderGoodsBinding
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.responsebean.OrderList

class AftermarketState0Delegate : BindingDelegate2<MainSeckill>() {
    override fun layoutId(): Int {
        return R.layout.item_aftermarket_state_0
    }

    override fun onBindViewHolder(
        viewHolder: RecyclerView.ViewHolder?,
        pos: Int,
        item: MainSeckill?,
        dataSize: Int
    ) {
        super.onBindViewHolder(viewHolder, pos, item, dataSize)

        viewHolder?.let {
            val root = it.itemView.findViewById<LinearLayout>(R.id.goods)
            for (i in 0..5) {
                val goods = DataBindingUtil.inflate<ItemOrderGoodsBinding>(
                    LayoutInflater.from(root.context),
                    R.layout.item_order_goods,
                    root,
                    false
                )
                goods.goods = OrderList.DataBean.GoodsBean()
                root.addView(goods.root)
            }
        }


    }

    override fun isForViewType(item: MainSeckill?): Boolean {
        return true
    }
}