package com.ds.worldfunclub.ui.delegate

import androidx.databinding.ViewDataBinding
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegateWithEventObject
import com.ds.worldfunclub.responsebean.DiscountGoods
import com.ds.worldfunclub.ui.CallGoodsDetails

class MainSeckillDelegate2 : BindingDelegateWithEventObject<DiscountGoods.DataBean>(), CallGoodsDetails {
    override fun layoutId() = R.layout.item_main_seckill2

    override fun isForViewType(item: DiscountGoods.DataBean?): Boolean {
        return item != null
    }


    override fun setVariables(dataBinding: ViewDataBinding?) {
        dataBinding?.setVariable(BR.eventGoods, this)
    }

}