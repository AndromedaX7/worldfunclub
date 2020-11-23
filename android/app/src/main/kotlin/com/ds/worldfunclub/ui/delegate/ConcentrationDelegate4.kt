package com.ds.worldfunclub.ui.delegate

import androidx.databinding.ViewDataBinding
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegateWithEventObject
import com.ds.worldfunclub.responsebean.CategoryGoods
import com.ds.worldfunclub.ui.CallGoodsDetails

class ConcentrationDelegate4 : BindingDelegateWithEventObject<CategoryGoods.DataBean>(),
    CallGoodsDetails {
    override fun layoutId() = R.layout.item_concentration4

    override fun setVariables(dataBinding: ViewDataBinding?) {
        dataBinding?.setVariable(BR.eventGoods, this)
    }

    override fun isForViewType(item: CategoryGoods.DataBean?): Boolean {
        return item != null
    }
}
