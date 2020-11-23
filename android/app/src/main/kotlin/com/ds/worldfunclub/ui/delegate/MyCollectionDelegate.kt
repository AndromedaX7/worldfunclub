package com.ds.worldfunclub.ui.delegate

import android.view.View
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.CollectListBean
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.CallGoodsDetails

class MyCollectionDelegate : BindingDelegate2<CollectListBean.DataBean>(),CallGoodsDetails {
    override fun layoutId(): Int {
        return R.layout.item_my_collection
    }

    fun onTap(view:View,data:CollectListBean.DataBean){
        goodsDetails(view,data.goods_id)
    }

    override fun isForViewType(item: CollectListBean.DataBean?): Boolean {
        return true
    }
}