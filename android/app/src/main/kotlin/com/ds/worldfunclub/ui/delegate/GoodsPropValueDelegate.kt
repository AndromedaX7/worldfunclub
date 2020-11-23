package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.GoodsDetailsResp
import com.ds.worldfunclub.responsebean.GoodsDetailsResp2
import com.ds.worldfunclub.viewmodel.GoodsDetailsModel

class GoodsPropValueDelegate(val propIndex: Int, val  goodsModel: GoodsDetailsModel) :
    BindingDelegate2<GoodsDetailsResp2.DataBean.SpecAttrBean.SpecItemsBean>() {

    var selectedPos=0
    override fun layoutId(): Int {
        return  R.layout.view_prop_item
    }

    fun onSelected(pos: Int ){
        selectedPos=pos
        goodsModel.selectPropIndex(propIndex,pos)
    }
}