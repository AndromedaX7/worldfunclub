package com.ds.worldfunclub.ui

import android.content.Context
import android.view.View
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.responsebean.GoodsArr

interface CallGoodsDetails {
    fun goodsDetails(v: View, goodsId: String) {
    }

    fun goodsDetails(v: View, goodsId: String, discountId: String) {
    }

    fun goodsDetails(v: View) {
        goodsDetails(v, "12")
    }
}

interface CallOrderCreate {

    fun createOrder(context: Context, goodsInfo: GoodsArr, self: GoodsType) {
    }

}