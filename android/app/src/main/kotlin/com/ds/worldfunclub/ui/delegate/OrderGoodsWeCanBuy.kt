package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.GoodsArr
import com.ds.worldfunclub.viewmodel.OrderConfirmModel

class OrderGoodsWeCanBuy(var model:OrderConfirmModel):BindingDelegate2<GoodsArr>() {
    override fun layoutId(): Int {
        return  R.layout.item_order_goods_item
    }

    fun setRemark(pos :Int){
        model.setRemark(pos)
    }
}