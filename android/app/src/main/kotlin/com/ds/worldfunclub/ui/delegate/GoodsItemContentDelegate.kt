package com.ds.worldfunclub.ui.delegate

import androidx.databinding.ViewDataBinding
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegateWithEventObject
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.CallGoodsDetails

class GoodsItemContentDelegate : BindingDelegateWithEventObject<MainSeckill>(), CallGoodsDetails {
    override fun layoutId(): Int {
        return R.layout.item_entry_goods_item
    }

    override fun isForViewType(item: MainSeckill?): Boolean {
        return true
    }

    override fun setVariables(dataBinding: ViewDataBinding?) {
        dataBinding?.setVariable(BR.eventGoods, this)
    }
}