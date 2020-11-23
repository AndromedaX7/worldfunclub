package com.ds.worldfunclub.ui.delegate

import androidx.databinding.ViewDataBinding
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.base.BindingDelegateWithEventObject
import com.ds.worldfunclub.responsebean.SearchGoodsData
import com.ds.worldfunclub.ui.CallGoodsDetails

class SearchGoodsDelegate : BindingDelegateWithEventObject<SearchGoodsData.DataBean>(),CallGoodsDetails {
    override fun layoutId(): Int {
        return R.layout.item_search_goods
    }

    override fun setVariables(dataBinding: ViewDataBinding?) {
        dataBinding?.setVariable(BR.eventGoods,this)
    }

}