package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.MainSeckill

class ConcentrationDelegate : BindingDelegate2<MainSeckill>() {
    override fun layoutId() = R.layout.item_concentration
    override fun isForViewType(item: MainSeckill?): Boolean {
        return true
    }
}