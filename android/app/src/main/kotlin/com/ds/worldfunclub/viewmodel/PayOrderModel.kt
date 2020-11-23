package com.ds.worldfunclub.viewmodel

import android.app.AlertDialog
import android.content.DialogInterface
import android.os.Handler
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.main
import com.ds.worldfunclub.app.orderList
import com.ds.worldfunclub.app.paySuccess
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.network.PayType
import com.ds.worldfunclub.ui.activity.order.PayOrderActivity
import com.ds.worldfunclub.wechatPay
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/26 14:52
 */
@ActivityScope
class PayOrderModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    @get:Bindable
    var payChangeEnabled = true
        set(value) {
            field = value
            notifyPropertyChanged(BR.payChangeEnabled)
        }

    @get:Bindable
    var selectPayType = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.selectPayType)
        }

    fun clickPayType(pos: Int) {
        selectPayType = pos
    }

    private fun finishPostDelay() {
        Handler().postDelayed({ activity.finish() }, 1500)
    }

    fun pay() {

        val orderId: String=activity(activity).orderId
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
                            (activity as PayOrderActivity) .pay,
                            GoodsType.values( activity.orderType)
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
                        ARouter.getInstance().build(main).navigation(activity)
                        ARouter.getInstance().build(paySuccess).withString("orderId",orderId).withString("orderType", GoodsType.Live.value).withString("pay",(activity as PayOrderActivity) .pay).navigation(activity)
//                        paySelf(activity)
                    } else {
                        toast(data)
                    }

                }

            }
        }
    }


    override fun activity(activity: AppCompatActivity): PayOrderActivity {
        return activity as PayOrderActivity
    }
}