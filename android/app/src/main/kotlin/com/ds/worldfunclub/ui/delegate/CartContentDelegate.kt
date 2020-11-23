package com.ds.worldfunclub.ui.delegate

import android.graphics.drawable.GradientDrawable
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.CartData
import com.ds.worldfunclub.responsebean.CartData2
import com.ds.worldfunclub.viewmodel.CartModel

class CartContentDelegate(val model: CartModel) : BindingDelegate2<CartData2.DataBean.GoodsListBean>() {
    override fun layoutId() = R.layout.item_cart_content

    fun selectedData(pos: Int, data: CartData2.DataBean.GoodsListBean) {
        data.isSelected = !data.isSelected
        model.changeSelected(pos)
    }

    fun operationGoodsCount(orientation: Boolean,data: CartData2.DataBean.GoodsListBean,pos: Int){
        model.increaseCartNum(orientation, data, pos)
    }

    override fun isForViewType(item: CartData2.DataBean.GoodsListBean?): Boolean {
        return true
    }
}