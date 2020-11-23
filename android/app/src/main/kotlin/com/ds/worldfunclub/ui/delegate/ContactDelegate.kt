package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.viewmodel.OrderDetailsModel

class ContactDelegate(val detail: OrderDetailsModel) : BindingDelegate2<String>() {
    override fun layoutId(): Int {
        return R.layout.item_comtact
    }

    fun call(phone: String) {
        detail.callPhone(phone)
    }
}