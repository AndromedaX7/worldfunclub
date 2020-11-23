package com.ds.worldfunclub.viewmodel

import android.Manifest
import android.content.Intent
import android.net.Uri
import android.view.LayoutInflater
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.databinding.DialogContactBinding
import com.ds.worldfunclub.databinding.ItemOrderGoodsBinding
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.OrderState
import com.ds.worldfunclub.network.PayType
import com.ds.worldfunclub.responsebean.CodeBarWrapper
import com.ds.worldfunclub.responsebean.OrderDetailsBean
import com.ds.worldfunclub.responsebean.OrderList
import com.ds.worldfunclub.ui.CallGoodsDetails
import com.ds.worldfunclub.ui.activity.order.OrderDetailsActivity
import com.ds.worldfunclub.ui.delegate.*
import com.google.zxing.BarcodeFormat
import kotlinx.android.synthetic.main.activity_order_details.*
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午2:39
 */
@ActivityScope
class OrderDetailsModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity), CallGoodsDetails {

    private val customerService = ArrayList<String>()
    private   var  orderData=ArrayList<OrderList.DataBean>()
    @get:Bindable
    val cAdapter = MultiTypeAdapter<String>()

    @get:Bindable
    val adapter = MultiTypeAdapter<OrderList.DataBean>()

    @get:Bindable
    var codebar: CodeBarWrapper? = null
        set(value) {
            field = value
            notifyPropertyChanged(BR.codebar)
        }

    @get:Bindable
    var payType: String = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.payType)
        }

    @get:Bindable
    var writeOffCode: String = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.writeOffCode)
        }

    @get:Bindable
    var self: Boolean = false
        set(value) {
            field = value
            notifyPropertyChanged(BR.self)
        }


    @get:Bindable
    var payTotal = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.payTotal)
        }

    @get:Bindable
    var create_time = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.create_time)
        }

    init {
        cAdapter.addDelegate(ContactDelegate(this))
    }

    @get:Bindable
    var addressName = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.addressName)
        }

    @get:Bindable
    var phone = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.phone)
        }

    @get:Bindable
    var userName = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.userName)
        }

    @get:Bindable
    var orderState = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.orderState)
        }

    @get:Bindable
    var orderState2 = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.orderState2)
        }

    @get:Bindable
    var shopName = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.shopName)
        }

    @get:Bindable
    var orderNo = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.orderNo)
        }

    private fun loadDetails(orderId: String) {
        if (app.wxInfo == null) {
            toast()
            return
        }
        rxLifeScope.launch {
            val rs = api.orderDetails(orderId, app.wxInfo!!.user_id, app.wxInfo!!.login_token)
            if (rs.code == 1) {
                parseResult(rs.data)
            }
        }
    }

    private fun parseResult(data: OrderDetailsBean.DataBean) {
        self = data.order_type == "1"
        adapter.addDelegate(OrderStateWillPay(false, source = self))
        adapter.addDelegate(OrderStateWillSend(false, source = self))
        adapter.addDelegate(OrderStateWillReceive(false, source = self))
        adapter.addDelegate(OrderStateWillPingjia(false, source = self))
        if (data.order_type == "1") {
            orderState = data.order_status
            addressName =
                "${data.address_province}${data.address_city}${data.address_region}${data.address_detail}"
            userName = data.address_name
            phone = data.address_phone

        } else {
            orderState2 = data.lh_order_status

//            addressName="${data.address_province}${data.address_city}${data.address_region}${data.address_detail}"
            userName = data.name
            phone = data.phone
//            val code = "{\n" +
//                    "  \"code\": 1,\n" +
//                    "  \"msg\": \"success\",\n" +
//                    "  \"data\": {\n" +
//                    "    \"order_id\": \"${data.order_id}\",\n" +
//                    "    \"write_off\": \"${data.write_off}\",\n" +
//                    "    \"order_no\": \"${data.order_no}\",\n" +
//                    "    \"total_num\": \"${data.goods[0].total_num}\",\n" +
//                    "    \"name\": \"${data.name}\",\n" +
//                    "    \"goods_name\": \"${data.goods[0].goods_name}\",\n" +
//                    "    \"writeOff_num\": \"1\",\n" +
//                    "    \"phone\": \"${data.phone}\",\n" +
//                    "    \"lh_start_time\": \"${data.lh_start_time}\",\n" +
//                    "    \"lh_end_time\": \"${data.lh_end_time}\"\n" +
//                    "  }\n" +
//                    "}"

            codebar = CodeBarWrapper(
                data.qrcode,
                BarcodeFormat.QR_CODE, OrderState.fromCode(data.lh_order_status)
            )
            writeOffCode = data.write_off
        }
        customerService.clear()
        customerService.addAll(data.customer_service)
        cAdapter.setData(customerService)
        adapter.setData(orderData)
        payType = PayType.fromString(data.pay_type).payName
        create_time = data.create_time

    }

    override fun onReady() {
        super.onReady()
        activity(activity).data?.let {
            val root = activity.orderDetails
            orderNo = it.order_no
            shopName = it.shop_name
            for (i in it.goods) {
                val goods = DataBindingUtil.inflate<ItemOrderGoodsBinding>(
                    LayoutInflater.from(root.context),
                    R.layout.item_order_goods,
                    root,
                    false
                )
                goods.goods = i
                goods.vm = this
                root.addView(goods.root)
            }

            payTotal = it.goods_money
            orderData.add(it)
            loadDetails(it.order_id)
        }
    }


    override fun activity(activity: AppCompatActivity): OrderDetailsActivity {
        return activity as OrderDetailsActivity
    }

    private var dialog: AlertDialog? = null

    fun openContact() {
        val bind = DataBindingUtil.inflate<DialogContactBinding>(
            activity.layoutInflater,
            R.layout.dialog_contact,
            null,
            false
        )
        bind.vm = this
        if (dialog == null)
            dialog = AlertDialog.Builder(activity)
                .setTitle("致电客服中心")
                .setMessage("选择一个客服专线致电客服中心")
                .setView(bind.root)
                .setNegativeButton("取消") { _, _ ->
                }
                .create()
        dialog!!.show()

    }

    fun callPhone(phone: String) {
        reqPermission(Manifest.permission.CALL_PHONE, 12) {
            dialog?.dismiss()
            activity.startActivity(Intent(Intent.ACTION_CALL, Uri.parse("tel:$phone")))
        }
    }
}

