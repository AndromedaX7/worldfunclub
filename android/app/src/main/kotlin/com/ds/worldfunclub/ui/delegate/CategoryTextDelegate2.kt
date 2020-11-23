package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.widget.DropDownManager

class CategoryTextDelegate2 :BindingDelegate2<String>() {
    override fun layoutId(): Int {
        return R.layout.item_category_text2
    }

    override fun isForViewType(item: String?): Boolean {
        return true
    }

    fun onTap(content :String){
        DropDownManager.dismiss()
    }

}