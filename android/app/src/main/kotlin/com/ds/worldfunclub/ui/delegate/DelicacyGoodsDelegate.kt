package com.ds.worldfunclub.ui.delegate

import android.view.View
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.delicacyCommit
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.DelicacyGoodsInfo
import com.ds.worldfunclub.responsebean.LiveBuy

class DelicacyGoodsDelegate :BindingDelegate2<DelicacyGoodsInfo>(){
    override fun layoutId(): Int {
        return  R.layout.item_delicacy_goods_info
    }

    fun onTap(data:DelicacyGoodsInfo,v:View){
        ARouter.getInstance().build(delicacyCommit)
            .withParcelable("data",LiveBuy.from(data))
            .navigation(v.context)
    }
}