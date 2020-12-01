//package com.ds.worldfunclub.viewmodel
//
//import android.app.Activity
//import android.content.Intent
//import android.graphics.Color
//import androidx.appcompat.app.AppCompatActivity
//import androidx.databinding.Bindable
//import androidx.lifecycle.rxLifeScope
//import com.alibaba.android.arouter.launcher.ARouter
//import com.ds.worldfunclub.R
//import com.ds.worldfunclub.app.App
//import com.ds.worldfunclub.app.newAddressActivity
//import com.ds.worldfunclub.base.BaseModel
//import com.ds.worldfunclub.base.MultiTypeAdapter
//import com.ds.worldfunclub.di.ActivityScope
//import com.ds.worldfunclub.network.Api
//import com.ds.worldfunclub.responsebean.AddressData
//import com.ds.worldfunclub.ui.activity.goods.SelectedAddressActivity
//import com.ds.worldfunclub.ui.delegate.SelectedAddressDelegate
//import com.ds.worldfunclub.ui.dialog.AlertDialog
//import javax.inject.Inject
//
///**
// * @Author 12031
// * @Date 2020/7/15 9:37
// */
//@ActivityScope
//class SelectedAddressModel @Inject constructor(
//        val activity: AppCompatActivity,
//        val app: App, val api: Api
//) : BaseModel(activity) {
//
//    @get:Bindable
//    val addressAdapter = MultiTypeAdapter<AddressData.DataBean>()
//
//    init {
//        addressAdapter.addDelegate(SelectedAddressDelegate(this))
//        userAddressList()
//    }
//
//    private fun userAddressList() {
//        rxLifeScope.launch {
//            if (app.wxInfo != null) {
//                val data =
//                        api.userAddressList(app.wxInfo!!.user_id, app.wxInfo!!.login_token)
//                if (data.code == 1) {
//                    addressAdapter.clear()
//                    addressAdapter.addData2(ArrayList(data.data))
//                } else {
//                    toast(data)
//                }
//            } else {
//                toast()
//            }
//
//        }
//    }
//
//
//    fun addAddress() {
//        ARouter.getInstance().build(newAddressActivity).navigation(activity, 10)
//    }
//
//    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
//        super.onActivityResult(requestCode, resultCode, data)
//        if (requestCode == 10 && resultCode == Activity.RESULT_OK) {
//            addressAdapter.clear()
//            userAddressList()
//        }
//    }
//
//    fun deleteAddress(pos: Int, data: AddressData.DataBean) {
//        val dialog = AlertDialog(activity)
//        dialog.setTitle("删除地址")
//                .withCancel()
//                .setOnOption1Click("删除", Color.parseColor("#E33542")) { _, _ -> processDeleteAddress(pos, data) }
//                .show()
//    }
//
//    private fun processDeleteAddress(pos: Int, data: AddressData.DataBean){
//        if (app.wxInfo == null) {
//            toast()
//        } else {
//            rxLifeScope.launch {
//                val result = api.delAddress(
//                        app.wxInfo!!.user_id,
//                        app.wxInfo!!.login_token,
//                        data.address_id
//                )
//                if (result.code == 1) {
//                    addressAdapter.data.remove(data)
//                    addressAdapter.notifyItemRemoved(pos)
//                }
//                toast(result)
//            }
//        }
//    }
//
//    fun editAddress(pos: Int, data: AddressData.DataBean) {
//        ARouter.getInstance().build(newAddressActivity)
//                .withBoolean("modify",true)
//                .withParcelable("data",data)
//                .navigation(activity, 10)
//    }
//
//    fun onSelected(data: AddressData.DataBean){
//        if(activity(activity).selected){
//            activity.setResult(Activity.RESULT_OK,Intent().putExtra("address",data))
//            activity.finish()
//        }
//    }
//
//    override fun activity(activity: AppCompatActivity): SelectedAddressActivity {
//        return super.activity(activity) as SelectedAddressActivity
//    }
//}
//
