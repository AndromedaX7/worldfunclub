package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.MainSeckill

class MyVipDelegate : BindingDelegate2<MainSeckill>() {
    override fun layoutId(): Int {
        return R.layout.item_my_vip
    }

    override fun isForViewType(item: MainSeckill?): Boolean {
        return true
    }
}