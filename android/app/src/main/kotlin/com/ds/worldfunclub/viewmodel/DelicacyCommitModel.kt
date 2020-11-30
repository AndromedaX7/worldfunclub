package com.ds.worldfunclub.viewmodel

import android.app.Activity
import android.app.AlertDialog
import android.app.DatePickerDialog
import android.app.TimePickerDialog
import android.os.Handler
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.databinding.library.baseAdapters.BR
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.LocalPlugin
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.toYuan
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.network.PayType
import com.ds.worldfunclub.toDateMillis
import com.ds.worldfunclub.ui.activity.order.DelicacyCommitActivity
import com.ds.worldfunclub.validate.ValidatePayLive
import com.ds.worldfunclub.validate.ValidatePayLive2
import com.ds.worldfunclub.wechatPay
import java.util.*
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/22 16:57
 */
@ActivityScope
class DelicacyCommitModel @Inject constructor(
        val activity: AppCompatActivity,
        val app: App, val api: Api
) : BaseModel(activity) {

    fun operationGoodsCount(orientation: Boolean) {

        val num = total_num.toInt()
        if (orientation) {
            if (total_num.toInt() >= stock_num.toInt()) {
                return
            } else {
                total_num = "${num + 1}"
            }
        } else {
            if (total_num.toInt() <= 1) {
                return
            } else {
                total_num = "${num - 1}"
            }
        }
        count_price = (total_num * goods_price).toYuan()
    }

    @get:Bindable
    var subscribeDate = ""
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.subscribeDate)
        }

    @get:Bindable
    var needSubScribeDate = false
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.needSubScribeDate)
        }

    @get:Bindable
    var phone = ""
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.phone)
        }

    @get:Bindable
    var name = ""
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.name)
        }

    @get:Bindable
    var remark = ""
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.remark)
        }

    @get:Bindable
    var goods_image = ""
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.goods_image)
        }

    @get:Bindable
    var stock_num = ""
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.stock_num)
        }

    @get:Bindable
    var goods_price = "0.00"
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.goods_price)
        }

    @get:Bindable
    var goods_attr = ""
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.goods_attr)
        }

    @get:Bindable
    var total_num = "1"
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.total_num)
        }

    @get:Bindable
    var goods_name = ""
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.goods_name)
        }

    @get:Bindable
    var count_price = "0.00"
        set(value) {
            field = value
            notifyPropertyChanged(com.ds.worldfunclub.BR.count_price)
        }

    @get:Bindable
    var selectPayType = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.selectPayType)
        }

    fun clickPayType(payId: Int) {
        selectPayType = payId
    }

    private fun findPayType(): PayType {
        return when (selectPayType) {
            1 -> PayType.WeChat
            2 -> PayType.AliPay
            3 -> PayType.Self
            else -> PayType.Other
        }
    }

    override fun onReady() {
        super.onReady()
        val data = activity(activity).data
        data?.let {

            it.goods_id
            it.skuId
            goods_price = it.goodsPrice
            subscribeDate = it.subscribeDate
            needSubScribeDate = it.needSubScribeDate
            goods_image = it.goods_image
            goods_attr = it.goods_attr
            goods_name = it.goods_name
            stock_num = it.stock_num
            count_price = (total_num * goods_price).toYuan()
        }
    }

    override fun activity(activity: AppCompatActivity): DelicacyCommitActivity {
        return activity as DelicacyCommitActivity
    }

    fun showDate() {
        val calendar = GregorianCalendar()

        DatePickerDialog(
                activity,
                { _, year, month, dayOfMonth ->
                    val m = month + 1
                    val mS = if (m < 10) {
                        "0$m"
                    } else {
                        "$m"
                    }

                    val day = if (dayOfMonth < 10) {
                        "0$dayOfMonth"
                    } else {
                        "$dayOfMonth"
                    }





                    subscribeDate = "$year-${mS}-$day"
                    TimePickerDialog(
                            activity,
                            { view, hourOfDay, minute ->
                                val hour = if (hourOfDay < 10) {
                                    "0$hourOfDay"
                                } else {
                                    "$hourOfDay"
                                }
                                val min = if (minute < 10) {
                                    "0$minute"
                                } else {
                                    "$minute"
                                }
                                subscribeDate += " $hour:$min"
                            }, 10, 0, true
                    ).show()
                },
                calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH),
                calendar.get(Calendar.DAY_OF_MONTH)
        ).show()
    }

    fun buy(v: View) {
        if (app.wxInfo == null) {
            toast()
            return
        }

        if (needSubScribeDate)
            ValidatePayLive(activity, name, phone, subscribeDate).validate {
                val data = activity(activity).data
                data?.let {
                    rxLifeScope.launch {
                        val resp = api.liveBuyNow(
                                app.wxInfo!!.user_id,
                                app.wxInfo!!.login_token,
                                data.goods_id,
                                total_num,
                                data.skuId,
                                findPayType().value,
                                (total_num * data.goodsPrice).toDouble().toYuan(),
                                name,
                                phone,
                                (subscribeDate.toDateMillis("yyyy-MM-dd HH:mm") / 1000).toString(),
                                remark
                        )

                        if (resp.code == 1) {
                            val dialog = AlertDialog.Builder(activity)
                                    .setTitle("去支付")
                                    .setCancelable(false)
                                    .setMessage("下单成功，现在支付吗？")
                                    .setPositiveButton(
                                            "去支付"
                                    ) { _, _ -> pay(resp.data.order_id) }
                                    .setNegativeButton("放弃支付") { _, _ ->
                                    }
                                    .create()
                            dialog.show()
                            activity.setResult(Activity.RESULT_OK)
                        } else {
                            toast(resp)
                        }

                    }
                }
            }
        else {
            ValidatePayLive2(activity, name, phone).validate {
                val data = activity(activity).data
                data?.let {
                    rxLifeScope.launch {
                        val resp = api.liveBuyNow(
                                app.wxInfo!!.user_id,
                                app.wxInfo!!.login_token,
                                data.goods_id,
                                total_num,
                                data.skuId,
                                findPayType().value,
                                (total_num * data.goodsPrice).toDouble().toYuan(),
                                name,
                                phone,
                                (subscribeDate.toDateMillis("yyyy-MM-dd HH:mm") / 1000).toString(),
                                remark
                        )

                        if (resp.code == 1) {
                            val dialog = AlertDialog.Builder(activity)
                                    .setTitle("去支付")
                                    .setCancelable(false)
                                    .setMessage("下单成功，现在支付吗？")
                                    .setPositiveButton(
                                            "去支付"
                                    ) { _, _ -> pay(resp.data.order_id) }
                                    .setNegativeButton("放弃支付") { _, _ ->
                                    }
                                    .create()
                            dialog.show()
                            activity.setResult(Activity.RESULT_OK)
                        } else {
                            toast(resp)
                        }

                    }
                }
            }
        }


        //    goods_id       :    String,    商品id
//    goods_num       :    String,    购买数量
//    goods_sku_id   :    String,    商品sku_id
//    pay_type       :    String,    支付方式 10 余额 20微信
//    goods_money       :    String,    商品总金额
//    name           :    String,    购买人姓名
//    phone           :    String,    购买人手机号码
//    subscribe_date:     String,    预约的时间 预约产品必填
//    remark           :    String,    备注


    }

    private fun pay(orderId: String) {
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
                                (total_num*goods_price).toYuan(),
                                GoodsType.Live
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
//                        TODO pay self start
//                        AlertDialog.Builder(activity)
//                            .setTitle("支付成功")
//                            .setCancelable(false)
//                            .setMessage("感谢您的购买！我们现在：")
//                            .setPositiveButton("查看订单") { dialogInterface: DialogInterface?, i: Int ->
//                                ARouter.getInstance().build(main).navigation(activity)
//                                ARouter.getInstance().build(orderList).withInt("state", 2)
//                                    .navigation(activity)
//                                finishPostDelay()
//                            }
//                            .setNegativeButton("回到首页") { dialogInterface: DialogInterface?, i: Int ->
//                                ARouter.getInstance().build(main).navigation(activity)
//                                finishPostDelay()
//                            }
//                            .create()
//                            .show()
//                        TODO pay self end

                        LocalPlugin.instance().paySuccess(orderId, GoodsType.Live.value, (total_num*goods_price).toYuan())
                        activity.finish()
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

