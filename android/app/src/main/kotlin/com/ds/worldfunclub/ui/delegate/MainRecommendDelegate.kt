package com.ds.worldfunclub.ui.delegate

import androidx.databinding.ViewDataBinding
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegateWithEventObject
import com.ds.worldfunclub.responsebean.CategoryGoods
import com.ds.worldfunclub.ui.CallGoodsDetails

class MainRecommendDelegate : BindingDelegateWithEventObject<CategoryGoods.DataBean>(),
    CallGoodsDetails {
    override fun layoutId(): Int = R.layout.item_recommend

    override fun isForViewType(item: CategoryGoods.DataBean?): Boolean {
        return true
    }

    override fun setVariables(dataBinding: ViewDataBinding?) {
        dataBinding?.setVariable(BR.eventGoods, this)
    }


}