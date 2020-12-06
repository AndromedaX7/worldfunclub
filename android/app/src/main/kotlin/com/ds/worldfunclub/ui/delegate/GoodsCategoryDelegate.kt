package com.ds.worldfunclub.ui.delegate

import android.view.View
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.lastCategory
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.HomeCategory
import com.google.gson.Gson

class GoodsCategoryDelegate :BindingDelegate2<HomeCategory.DataBean.ChildBean >() {
    override fun layoutId(): Int {
        return  R.layout.item_goods_category
    }

    fun onTap(item:HomeCategory.DataBean.ChildBean,view:View){
         ARouter.getInstance().build(lastCategory)
            .withString("category2",Gson().toJson(item))
            .navigation(view.context)
    }
}