package com.ds.worldfunclub.ui.delegate

import androidx.databinding.ObservableInt
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.AddressArea
import com.ds.worldfunclub.widget.AddressPicker

class AddressPickerDelegate(val model :AddressPicker):BindingDelegate2<AddressArea>() {
    override fun layoutId(): Int {
        return R.layout.item_address_picker
    }
    var selected =ObservableInt()
    fun onTab(pos:Int,data :AddressArea){

        model.selectedArea( pos,data)
        selected.set(pos)
    }
}