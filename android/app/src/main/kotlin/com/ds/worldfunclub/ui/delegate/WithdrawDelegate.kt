package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.BankListBean
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.viewmodel.WithdrawModel

class WithdrawDelegate (val model:WithdrawModel): BindingDelegate2<BankListBean.DataBean>() {

    override fun layoutId(): Int {
        return R.layout.item_withdraw_card
    }

    override fun isForViewType(item: BankListBean.DataBean?): Boolean {
        return true
    }

    fun posChange(pos:Int){
        model.changeSelected(pos)
    }

    fun delete(bankId:String ):Boolean{
        model.delete(bankId)
        return true
    }

}