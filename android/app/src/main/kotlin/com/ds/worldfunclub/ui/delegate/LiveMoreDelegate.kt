package com.ds.worldfunclub.ui.delegate

import android.view.View
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.delicacyDetails
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.CategoryGoods

class LiveMoreDelegate : BindingDelegate2<CategoryGoods.DataBean>() {
    override fun layoutId(): Int {
        return R.layout.item_live_more
    }

    fun details(data: CategoryGoods.DataBean, view: View) {
        ARouter.getInstance().build(delicacyDetails).withString("goodsId", data.goods_id)
            .navigation(view.context)
    }

}