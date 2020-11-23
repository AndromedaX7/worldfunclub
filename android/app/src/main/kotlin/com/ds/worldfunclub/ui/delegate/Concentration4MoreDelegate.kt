package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.FooterTextDelegate
import com.ds.worldfunclub.responsebean.CategoryGoods

class Concentration4MoreDelegate : FooterTextDelegate<CategoryGoods.DataBean>() {
    override fun layoutId() = R.layout.item_concentration4_more

    override fun isForViewType(item: CategoryGoods.DataBean?): Boolean {
        return item == null
    }

}
