package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.ExpressBean

class ExpressDelegate : BindingDelegate2<ExpressBean.DataBean.DeliveryListBean>() {
    override fun layoutId(): Int {
        return R.layout.item_express
    }
}