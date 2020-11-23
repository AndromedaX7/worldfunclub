package com.ds.worldfunclub.ui.delegate

import androidx.databinding.ViewDataBinding
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegateWithEventObject
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.CallGoodsDetails

class MainSeckillDelegate : BindingDelegateWithEventObject<MainSeckill>(), CallGoodsDetails {
    override fun layoutId() = R.layout.item_main_seckill


    override fun isForViewType(item: MainSeckill?): Boolean {
        return true
    }


    override fun setVariables(dataBinding: ViewDataBinding?) {
        dataBinding?.setVariable(BR.eventGoods, this)
    }

}