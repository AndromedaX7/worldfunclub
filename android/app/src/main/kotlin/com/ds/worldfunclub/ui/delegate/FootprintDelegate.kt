package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.Footpoint

class FootprintDelegate : BindingDelegate2<Footpoint>() {
    override fun layoutId(): Int {
        return R.layout.item_footprint_date
    }


}