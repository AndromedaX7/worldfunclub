package com.ds.worldfunclub.viewmodel

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.addCardOfBank
import com.ds.worldfunclub.app.withdrawRecord
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.BankListBean
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.WithdrawDelegate
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午3:04
 */
@ActivityScope
class WithdrawModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    @get:Bindable
    var pos=-1
    set(value) {
        field=value
        notifyPropertyChanged(BR.pos)
    }

    @get:Bindable
    var money=""
    set(value) {
        field=value
        notifyPropertyChanged(BR.money)
    }

    @get:Bindable
    val adapter = MultiTypeAdapter<BankListBean.DataBean>()

    init {
        adapter.addDelegate(WithdrawDelegate(this))
        bankList()
    }

    private  fun bankList(){
        if(app.wxInfo ==null) {
            toast()
            return
        }else{
            rxLifeScope.launch {
                val bankList = api.bankList(app.wxInfo!!.user_id)
                if(bankList.code == 1){
                    adapter.addData2(ArrayList(bankList.data))
                }
            }
        }
    }


    fun addCard() {
        ARouter.getInstance().build(addCardOfBank).navigation(activity,10)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if(requestCode == 10&&resultCode ==Activity.RESULT_OK){
            adapter.clear()
            bankList()
        }
    }

    fun record() {
        ARouter.getInstance().build(withdrawRecord).navigation()
    }

    fun delete(bankId: String) {

        if(app.wxInfo ==null) {
            toast()
            return
        }else{
            AlertDialog.Builder(activity)
                .setTitle("删除银行卡")
                .setMessage("您将删除绑定的银行卡，是否继续？")
                .setPositiveButton("删除"){_,_->
                    rxLifeScope.launch {
                        val bankList = api.deleteBankCard(app.wxInfo!!.user_id,bankId)
                        if(bankList.code == 1){
                            adapter.clear()
                            bankList()
                        }
                        toast(bankList)
                    }
                }
                .setNegativeButton("取消"){_,_->}
                .create()
                .show()
        }

    }

    fun changeSelected(pos:Int){
        val  last  =pos
        this.pos=pos
        adapter.notifyItemChanged(last)
        adapter.notifyItemChanged(this.pos)
    }
    
    fun commit(){

        if(app.wxInfo == null){
            toast()
            return
        }
        if(pos == -1){
//            toast("微信提现")

            rxLifeScope.launch {

                val applyWithdraw =
                    api.applyWithdraw(app.wxInfo!!.user_id, "", money, "10")
                if(applyWithdraw.code == 1){
                    activity.finish()
                }

                toast(applyWithdraw)
            }
            return
        }

        if(pos == -2){
//            toast("支付宝提现")

            rxLifeScope.launch {

                val applyWithdraw =
                    api.applyWithdraw(app.wxInfo!!.user_id, "", money, "20")
                if(applyWithdraw.code == 1){
                    activity.finish()
                }

                toast(applyWithdraw)
            }
            return
        }

        rxLifeScope.launch {

            val applyWithdraw =
                api.applyWithdraw(app.wxInfo!!.user_id, adapter.data[pos].bankcard_id, money, "30")
            if(applyWithdraw.code == 1){
                activity.finish()
            }

            toast(applyWithdraw)
        }
    }
}
