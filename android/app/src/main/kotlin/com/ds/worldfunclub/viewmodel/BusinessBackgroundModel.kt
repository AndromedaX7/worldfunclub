package com.ds.worldfunclub.viewmodel

import android.Manifest
import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.scanCode
import com.ds.worldfunclub.app.withdrawBusi
import com.ds.worldfunclub.app.writeOff
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.ApiImplV2
import com.ds.worldfunclub.responsebean.WriteOffBean
import com.ds.worldfunclub.ui.delegate.BusiOrderDeleage
import com.google.zxing.client.android.CaptureActivity
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/14 16:13
 */
@ActivityScope
class BusinessBackgroundModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    @get:Bindable
    var shop_balance ="0.00"
    set(value) {
        field=value
        notifyPropertyChanged(BR.shop_balance)
    }
    fun withdraw() {
        ARouter.getInstance().build(com.ds.worldfunclub.app.withdraw ).withBoolean("shop",true).navigation(activity)
    }

    fun scan() {
        reqPermission(Manifest.permission.CAMERA,123){
            CaptureActivity.scan(this.activity)
        }
    }

    val adapter = MultiTypeAdapter<WriteOffBean.DataBean>()


    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if(requestCode == CaptureActivity.SCAN_REQUEST&& resultCode == Activity.RESULT_OK){
            val res =data!!.getStringExtra("data")?:""
            if(res.startsWith((api as ApiImplV2).baseUrl)){
                ARouter.getInstance().build(writeOff).withString("url",res).navigation(activity,11)
            }
        }
        if(requestCode == 11&& resultCode == Activity.RESULT_OK){
            val res =data!!.getStringExtra("data")?:"0.00"
            shop_balance=res
        }
    }
    init {
        adapter.addDelegate(BusiOrderDeleage())
        loadList()

    }


    private fun loadList() {
        if (app.wxInfo == null) {
            toast()
            return
        }
        rxLifeScope.launch {
            val writeOffList =
                api.getWriteOffList(app.wxInfo!!.user_id, app.wxInfo!!.login_token, page)

            canLoad = if (writeOffList.code == 1) {
                val data = writeOffList.data
                adapter.addData2(ArrayList(data))
                data.size > 0
            } else {
                false
            }
        }
    }

    private fun balance(){
        if (app.wxInfo == null) {
            toast()
            return
        }
        rxLifeScope.launch {
            val shopBalance = api.getShopBalance(app.wxInfo!!.user_id, app.wxInfo!!.login_token)
            if(shopBalance.code ==1 ){
                shop_balance= shopBalance.data.shop_balance
            }
        }
    }

    override fun loadMore() {
        super.loadMore()
        loadList()
    }
}