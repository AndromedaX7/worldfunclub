package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.viewmodel.GoodsCategoryModel

class GoodsCategoryLevel1Delegate(private val model: GoodsCategoryModel) :
    BindingDelegate2<HomeCategory.DataBean>() {

    var pos = 0
    override fun layoutId(): Int {
        return R.layout.item_goods_category_level_1
    }


    fun change(pos: Int) {
        val last = this.pos
        this.pos = pos
        model.level1.notifyItemChanged(pos)
        model.level1.notifyItemChanged(last)
        model.show(pos)
    }
}