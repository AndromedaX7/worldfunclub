package com.ds.worldfunclub.viewmodel

import android.app.Activity
import android.app.AlertDialog
import android.app.ProgressDialog
import android.content.DialogInterface
import android.content.Intent
import android.os.Handler
import android.text.TextUtils
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.*
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.base.toYuan
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.network.PayFrom
import com.ds.worldfunclub.network.PayType
import com.ds.worldfunclub.responsebean.AddressData
import com.ds.worldfunclub.responsebean.GoodsArr
import com.ds.worldfunclub.responsebean.GoodsArr2
import com.ds.worldfunclub.ui.activity.order.OrderConfirmActivity
import com.ds.worldfunclub.ui.delegate.OrderGoodsWeCanBuy
import com.ds.worldfunclub.wechatPay
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/15 下午4:22
 */
@ActivityScope
class OrderConfirmModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    var lastOrderId = ""

    @get:Bindable
    var payChangeEnabled = true
        set(value) {
            field = value
            notifyPropertyChanged(BR.payChangeEnabled)
        }


    lateinit var progressDialog: ProgressDialog
    var data = AddressData.DataBean()
    var payFrom: PayFrom? = null

    @get:Bindable
    var selectPayType = 1
        set(value) {
            field = value
            notifyPropertyChanged(BR.selectPayType)
        }

    @get:Bindable
    val goodsAdapter = MultiTypeAdapter<GoodsArr>()

    @get:Bindable
    var name = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.name)
        }

    @get:Bindable
    var mobile = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.mobile)
        }

    @get:Bindable
    var address = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.address)
        }

    @get:Bindable
    var allPay = "0.00"
        set(value) {
            field = value
            notifyPropertyChanged(BR.allPay)
        }

    override fun onReady() {
        super.onReady()
        goodsAdapter.clear()
        payFrom = if (activity(activity).buyOne) {
            goodsAdapter.addData2(arrayListOf(activity(activity).goods))
            PayFrom.GoodsDetails
        } else {
            goodsAdapter.addData2(ArrayList(activity(activity).goodsAll))
            PayFrom.Cart
        }
        allPay = computeGoodsPrice().toYuan()

        loadUserCoupon()
        progressDialog = ProgressDialog(activity)
        progressDialog.setTitle("发起支付")
        progressDialog.setMessage("正在核验订单")
        progressDialog.setCancelable(false)

    }

    @get:Bindable
    var selected = false
        set(value) {
            field = value
            notifyPropertyChanged(BR.selected)
        }

    fun addressSelected() {
        ARouter.getInstance().build(selectAddressActivity)
            .withBoolean("selected", true).navigation(activity, 10)
    }

    fun loadUserCoupon() {
        if (app.wxInfo == null) {
            toast()
            return
        }

        rxLifeScope.launch {
            val data =
                api.getUserCoupon(app.wxInfo!!.user_id, app.wxInfo!!.login_token, allPay)
            if (data.code == 1) {

            }
        }
    }

    init {
        goodsAdapter.addDelegate(OrderGoodsWeCanBuy(this))
        loadDefaultAddress()
    }

    private fun loadDefaultAddress() {
        if (app.wxInfo == null)
            toast()
        else {
            rxLifeScope.launch {
                val data =
                    api.getDefaultAddress(app.wxInfo!!.user_id, app.wxInfo!!.login_token)
                if (data.code == 1) {
                    this@OrderConfirmModel.data = data.data
                    name = data.data.name
                    mobile = data.data.phone
                    address =
                        data.data.region.province + data.data.region.city + data.data.region.region + data.data.detail
                    selected = true
                } else {
                    toast(data)
                }
            }
        }

    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 10 && resultCode == Activity.RESULT_OK) {
            data?.let {
                val address: AddressData.DataBean? = data.getParcelableExtra("address")
                address?.let {
                    this.data = it
                    name = it.name
                    mobile = it.phone
                    this.address =
                        it.region.province + it.region.city + it.region.region + it.detail
                    selected = true
                }

            }
        }
    }

    override fun activity(activity: AppCompatActivity): OrderConfirmActivity {
        return super.activity(activity) as OrderConfirmActivity
    }

    fun setRemark(pos: Int) {
        val remark = EditText(activity)
        remark.setText(goodsAdapter.data[pos].remark)
        remark.hint = "买家留言200字以内（选填）"
        AlertDialog.Builder(activity)
            .setCancelable(true)
            .setTitle("商品备注")
            .setView(remark)
            .setPositiveButton("确定") { _, _ ->
                goodsAdapter.data[pos].remark = remark.text.toString()
                goodsAdapter.notifyItemChanged(pos)
            }
            .setNegativeButton("取消") { _, _ -> }
            .create().show()
    }

    fun clickPayType(pos: Int) {
        selectPayType = pos
    }

    fun createOrder() {
        if (TextUtils.isEmpty(lastOrderId)) {
            val desc = ArrayList<GoodsArr2>()
            for (d in goodsAdapter.data) {
                desc.add(GoodsArr2.from(d))
            }
            if (TextUtils.isEmpty(data.address_id)) {
                toast("请选择收件地址")
                return
            }
            if (app.wxInfo == null) {
                toast()
            } else {
                progressDialog.show()
                rxLifeScope.launch {
                    val resp = api.createOrder(
                        app.wxInfo!!.user_id,
                        app.wxInfo!!.login_token,
                        allPay,
                        GoodsType.Self,
                        data.address_id,
                        findPayType(),
                        payFrom!!,
                        desc
                    )
                    progressDialog.dismiss()
                    if (resp.code == 1) {
                        val dialog = AlertDialog.Builder(activity)
                            .setTitle("去支付")
                            .setCancelable(false)
                            .setMessage("下单成功，现在支付吗？")
                            .setPositiveButton(
                                "去支付"
                            ) { _, _ -> pay(resp.data.order_id) }
                            .setNegativeButton("放弃支付") { _, _ ->
                                payChangeEnabled = false
                                lastOrderId = resp.data.order_id
                            }
                            .create()
                        dialog.show()
                        activity.setResult(Activity.RESULT_OK)
                    } else {
                        toast(resp)
                    }

                }
            }
        } else {
            progressDialog.dismiss()
            val dialog = AlertDialog.Builder(activity)
                .setTitle("去支付")
                .setCancelable(false)
                .setMessage("当前订单支付未完成，继续支付吗？")
                .setPositiveButton(
                    "去支付"
                ) { _, _ ->
                    pay(lastOrderId)
                    lastOrderId = ""
                    payChangeEnabled = true
                }
                .setNegativeButton("放弃支付") { _, _ ->
                    payChangeEnabled = false
                }
                .create()
            dialog.show()
            activity.setResult(Activity.RESULT_OK)
        }
    }

    private fun findPayType(): PayType {
        return when (selectPayType) {
            1 -> PayType.WeChat
            2 -> PayType.AliPay
            3 -> PayType.Self
            else -> PayType.Other
        }
    }

    private fun computeGoodsPrice(): Double {
        var price = 0.0
        for (d in goodsAdapter.data) {
            price += d.count_price.toDouble()
        }
        return price
    }

    fun pay(orderId: String) {
        if (app.wxInfo == null) {
            toast()
            return
        }
        when (selectPayType) {
            1 -> {
                rxLifeScope.launch {
                    val data = api.payAuthWechat(
                        app.wxInfo!!.user_id,
                        app.wxInfo!!.login_token,
                        orderId
                    )
                    if (data.code == 1) {
                        val content = data.data
                        wechatPay(
                            context,
                            content.prepayid,
                            content.timestamp,
                            content.noncestr,
                            content.sign,
                            orderId,
                            allPay,
                            GoodsType.Self
                        )
                    }
                }

            }
            2 -> {
//                rxLifeScope.launch {
//                    val data = api.payAuthWechat(
//                        app.wxInfo!!.user_id,
//                        app.wxInfo!!.login_token,
//                        orderId
//                    )
//                    if (data.code == 1) {
//                        val content = data.data
//                        withContext(Dispatchers.IO) {
//                            val map = alipay(activity, "")
//                            withContext(Dispatchers.Main) {
//
//                            }
//                        }
//                    }
//                }
            }
            3 -> {
                rxLifeScope.launch {
                    val data = api.payBalance(
                        app.wxInfo!!.user_id,
                        app.wxInfo!!.login_token,
                        orderId
                    )
                    if (data.code == 1) {
                        val content = data.data

                        ARouter.getInstance().build(main).navigation(activity)
                        ARouter.getInstance().build(paySuccess).withString("orderId", orderId).withString("orderType", GoodsType.Self.value).withString("pay",allPay).navigation(activity)
//                        paySelf(activity)
                    } else {
                        toast(data)
                    }

                }

            }
        }
    }

    private fun finishPostDelay() {
        Handler().postDelayed({ activity.finish() }, 1500)
    }
}

