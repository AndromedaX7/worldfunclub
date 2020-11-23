package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.GoodsCouponData
import com.ds.worldfunclub.viewmodel.GoodsDetailsModel

class GoodsCouponDelegate(val model: GoodsDetailsModel) :
    BindingDelegate2<GoodsCouponData.DataBean>() {
    override fun layoutId(): Int {
        return R.layout.item_goods_coupon
    }

    fun receive(pos:Int, data: GoodsCouponData.DataBean) {
        if (data.status == "1")
            model.receiveCoupon(pos, data)
    }
}