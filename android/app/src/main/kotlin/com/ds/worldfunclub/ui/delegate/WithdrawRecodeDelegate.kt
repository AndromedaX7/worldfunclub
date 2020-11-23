package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.responsebean.WithdrawBean

class WithdrawRecodeDelegate : BindingDelegate2<WithdrawBean.DataBean>() {
    override fun layoutId(): Int {
        return R.layout.item_withdraw_record
    }

    override fun isForViewType(item: WithdrawBean.DataBean?): Boolean {
        return true
    }
}