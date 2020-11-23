package com.ds.worldfunclub.ui.delegate

import android.util.Log
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.DiscountList
import com.ds.worldfunclub.viewmodel.TabHomeFragmentModel

class DiscountDelegate(val model: TabHomeFragmentModel) :
    BindingDelegate2<DiscountList.DataBean>() {

    var selected = -1

    override fun layoutId(): Int {
        return R.layout.item_discount_time
    }

    fun onSelected(pos: Int, data: DiscountList.DataBean) {
        selected = pos
        model.selectedTime( data)
    }
}