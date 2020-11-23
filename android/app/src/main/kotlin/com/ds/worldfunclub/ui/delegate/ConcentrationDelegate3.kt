package com.ds.worldfunclub.ui.delegate

import androidx.databinding.ViewDataBinding
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.shopDetailsActivity
import com.ds.worldfunclub.base.BindingDelegateWithEventObject
import com.ds.worldfunclub.responsebean.CategoryGoods
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.CallGoodsDetails

class ConcentrationDelegate3 : BindingDelegateWithEventObject<CategoryGoods.DataBean>(), CallGoodsDetails {
    override fun layoutId() = R.layout.item_concentration3

    override fun setVariables(dataBinding: ViewDataBinding?) {
        dataBinding?.setVariable(BR.eventGoods, this)
    }
}
