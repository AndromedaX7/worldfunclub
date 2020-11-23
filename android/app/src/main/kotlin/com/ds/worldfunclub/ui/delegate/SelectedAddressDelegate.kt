package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.AddressData
import com.ds.worldfunclub.viewmodel.SelectedAddressModel

class SelectedAddressDelegate(val model: SelectedAddressModel) :
        BindingDelegate2<AddressData.DataBean>() {
    override fun layoutId(): Int {
        return R.layout.item_selected_address
    }

    fun delAddress(pos: Int, data: AddressData.DataBean):Boolean {
        model.deleteAddress(pos, data)
        return true
    }

    fun editAddress(pos: Int, data: AddressData.DataBean) {
        model.editAddress(pos, data)
    }

    fun onSelected(data: AddressData.DataBean){
        model.onSelected(data)
    }
}