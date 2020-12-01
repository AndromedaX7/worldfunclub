//package com.ds.worldfunclub.viewmodel
//
//import android.app.Activity
//import android.graphics.Color
//import android.util.Log
//import androidx.appcompat.app.AppCompatActivity
//import androidx.databinding.Bindable
//import androidx.lifecycle.rxLifeScope
//import com.ds.worldfunclub.BR
//import com.ds.worldfunclub.app.App
//import com.ds.worldfunclub.base.BaseModel
//import com.ds.worldfunclub.di.ActivityScope
//import com.ds.worldfunclub.network.Api
//import com.ds.worldfunclub.responsebean.AddressArea
//import com.ds.worldfunclub.ui.activity.goods.NewAddressActivity
//import com.ds.worldfunclub.ui.dialog.AlertDialog
//import com.ds.worldfunclub.validate.ValidateAddressData
//import com.ds.worldfunclub.widget.AddressPicker
//import com.ds.worldfunclub.widget.AddressPickerListener
//import javax.inject.Inject
//
///**
// * @Author tachibanako
// * @Date 2020/7/15 下午2:56
// */
//@ActivityScope
//class NewAddressModel @Inject constructor(
//        val activity: AppCompatActivity,
//        val app: App, val api: Api
//) : BaseModel(activity) {
//
//    @get:Bindable
//    var id = ""
//        set(value) {
//            field = value
//            notifyPropertyChanged(BR.id)
//        }
//
//    @get:Bindable
//    var defaultAddr = false
//        set(value) {
//            field = value
//            notifyPropertyChanged(BR.defaultAddr)
//        }
//
//    @get:Bindable
//    var addressAll = ""
//        set(value) {
//            field = value
//            notifyPropertyChanged(BR.addressAll)
//        }
//
//    @get:Bindable
//    var fullAddress = ""
//        set(value) {
//            field = value
//            notifyPropertyChanged(BR.fullAddress)
//        }
//
//    @get:Bindable
//    var mobile = ""
//        set(value) {
//            field = value
//            notifyPropertyChanged(BR.mobile)
//        }
//
//    @get:Bindable
//    var name = ""
//        set(value) {
//            field = value
//            notifyPropertyChanged(BR.name)
//        }
//
//
//    var area1: AddressArea? = null
//    var area2: AddressArea? = null
//    var area3: AddressArea? = null
//
//    private val picker = AddressPicker.create(activity, object : AddressPickerListener {
//        override fun area(area1: AddressArea, area2: AddressArea, area3: AddressArea) {
//            Log.e("address", "${area1.name}|${area2.name}|${area3.name}")
//            addressAll = "${area1.name}${area2.name}${area3.name}"
//            this@NewAddressModel.area1 = area1
//            this@NewAddressModel.area2 = area2
//            this@NewAddressModel.area3 = area3
//        }
//    })
//
//    fun showPicker() {
//        picker.show()
//    }
//
//    fun commit() {
//        if (app.wxInfo == null) {
//            toast()
//            return
//        }
//        ValidateAddressData(
//            area1,
//            area2,
//            area3,
//            fullAddress,
//            name, mobile, context
//        ).validate {
//            rxLifeScope.launch {
//
//                val data = if (activity(activity).modify) {
//                    api.editAddress(
//                        id,  app.wxInfo!!.user_id,
//                        app.wxInfo!!.login_token,
//                        "${area1!!.id},${area2!!.id},${area3!!.id}",
//                        name,
//                        mobile,
//                        fullAddress,
//                        defaultAddr
//                    )
//                } else
//                    api.addAddress(
//                        app.wxInfo!!.user_id,
//                        app.wxInfo!!.login_token,
//                        "${area1!!.id},${area2!!.id},${area3!!.id}",
//                        name,
//                        mobile,
//                        fullAddress,
//                        defaultAddr
//
//                    )
//                if (data.code == 1) {
//                    activity.setResult(Activity.RESULT_OK)
//                }
//                toast(data)
//                activity.finish()
//            }
//        }
//
//
//
//
//    }
//
//    fun deleteCurrent(){
//        val dialog = AlertDialog(activity)
//        dialog.setTitle("删除地址")
//                .withCancel()
//                .setOnOption1Click("删除", Color.parseColor("#E33542")) { _, _ ->
//                    if (app.wxInfo == null) {
//                    toast()
//                } else {
//                    rxLifeScope.launch {
//                        val result = api.delAddress(
//                                app.wxInfo!!.user_id,
//                                app.wxInfo!!.login_token,
//                                id
//                        )
//                        if (result.code == 1) {
//                            activity.setResult(Activity.RESULT_OK)
//                            activity.finish()
//                        }
//                        toast(result)
//                    }
//                } }
//                .show()
//    }
//
//    override fun onReady() {
//        super.onReady()
//        if (activity(activity).modify) {
//            val data = activity(activity).data!!
//            id = data.address_id
//            area1 = AddressArea()
//            area1!!.id = data.province_id
//            area1!!.name = data.region.province
//
//            area2 = AddressArea()
//            area2!!.id = data.city_id
//            area2!!.name = data.region.city
//
//            area3 = AddressArea()
//            area3!!.id = data.region_id
//            area3!!.name = data.region.region
//            fullAddress = data.detail
//            defaultAddr = data.is_default == "2"
//            name = data.name
//            mobile = data.phone
//            addressAll = "${area1!!.name}${area2!!.name}${area3!!.name}"
//        }
//    }
//
//    override fun activity(activity: AppCompatActivity): NewAddressActivity {
//        return super.activity(activity) as NewAddressActivity
//    }
//}
//
