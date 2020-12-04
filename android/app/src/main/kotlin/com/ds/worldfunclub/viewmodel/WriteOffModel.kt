package com.ds.worldfunclub.viewmodel

import android.app.Activity
import android.content.Intent
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.merchant.WriteOffActivity
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/14 16:14
 */
@ActivityScope
class WriteOffModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    @get:Bindable
    var order_id=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.order_id)
    }
    @get:Bindable
    var write_off=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.write_off)
    }
    @get:Bindable
    var order_no=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.order_no)
    }
    @get:Bindable
    var total_num=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.total_num)
    }
    @get:Bindable
    var name=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.name)
    }
    @get:Bindable
    var goods_name=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.goods_name)
    }
    @get:Bindable
    var writeOff_num=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.writeOff_num)
    }
    @get:Bindable
    var phone=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.phone)
    }
    @get:Bindable
    var date=""
    set(value) {
        field =value
        notifyPropertyChanged(BR.date)
    }

    override fun onReady() {
        super.onReady()
        rxLifeScope.launch {
            val loadScanInfo = api.loadScanInfo((activity as WriteOffActivity).url)
            if(loadScanInfo.code == 1){
                Log.e("scaninfo",loadScanInfo.data.goods_name)

               order_id=loadScanInfo.data.order_id
                write_off=loadScanInfo.data.write_off
                order_no=loadScanInfo.data.order_no
                total_num=loadScanInfo.data.total_num
                name=loadScanInfo.data.name
                goods_name=loadScanInfo.data.goods_name
                writeOff_num=loadScanInfo.data.writeOff_num
                phone=loadScanInfo.data.phone
                date="${loadScanInfo.data.lh_start_time}-${loadScanInfo.data.lh_end_time}"
            }
        }
    }

    fun commit(){
        if(app.wxInfo == null ){
            toast()
            return
        }
        rxLifeScope.launch {

            val writeOff = api.writeOff(order_id, app.wxInfo!!.user_id, app.wxInfo!!.login_token)
            if(writeOff.code == 1){
                toast("核销成功")
                activity.setResult(Activity.RESULT_OK, Intent().putExtra("data",writeOff.data.shop_balance))
                activity.finish()
            }else{
                toast(writeOff)
            }
        }
    }
}