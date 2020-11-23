package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.WriteOffBean

class BusiOrderDeleage:BindingDelegate2<WriteOffBean.DataBean>() {
    override fun layoutId(): Int {
        return R.layout.item_busi_order
    }
}