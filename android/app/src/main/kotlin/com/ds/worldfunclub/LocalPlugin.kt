package com.ds.worldfunclub

import android.content.Context
import android.content.Intent
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.room.LoginInfoEntry
import com.ds.worldfunclub.wxapi.WXPayEntryActivity
import com.tencent.mm.opensdk.modelmsg.SendAuth
import com.tencent.mm.opensdk.modelpay.PayReq
import com.tencent.mm.opensdk.openapi.WXAPIFactory
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class LocalPlugin private constructor(val context: Context, flutterEngine: FlutterEngine) : MethodChannel.MethodCallHandler {

    private val channel: MethodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.ds.worldfunclub.local")

    init {
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "loginWithWechat" -> {
                val api = WXAPIFactory.createWXAPI(context, "wx43736892a139b092")
                val req = SendAuth.Req()
                req.scope = "snsapi_userinfo"
                req.state = "wechat_login_world_fun_club"
                api.sendReq(req)
                result.success(true)
            }
            "startRouteActivity" -> {
                val route = call.argument<String>("route")
                val args = call.argument<Map<String, String>>("args")
                App.app!!.wxInfo = LoginInfoEntry()
                val info = App.app!!.wxInfo!!
                info.user_id = call.argument<String>("userId")!!
                info.login_token = call.argument<String>("token")!!

                val navigation = ARouter.getInstance().build(route)
                args?.forEach {
                    navigation.withString(it.key, it.value)
                }
                navigation.navigation()
            }


            "wechatPay" -> {
                val orderId = call.argument<String>("orderId") ?: ""
                val goodsType = call.argument<String>("goodsType") ?: ""
                val payMoney = call.argument<String>("payMoney") ?: ""
                val prepayId = call.argument<String>("prepayid") ?: ""
                val nonceStr = call.argument<String>("noncestr") ?: ""
                val timeStamp = call.argument<String>("timestamp") ?: ""
                val sign = call.argument<String>("sign") ?: ""
                val api = WXAPIFactory.createWXAPI(context, null)
                val request = PayReq()
                WXPayEntryActivity.setExtData(request, orderId, GoodsType.values(goodsType), payMoney)
                request.appId = "wx43736892a139b092"
                request.partnerId = "1602989977"
                request.prepayId = prepayId
                request.packageValue = "Sign=WXPay"
                request.nonceStr = nonceStr
                request.timeStamp = timeStamp
                request.sign = sign
                api.sendReq(request)
            }
        }
    }

    fun responseWechatCode(code: String) {
        channel.invokeMethod("wechatCodeResponse", code)
    }

    fun paySuccess(orderId: String, orderType: String, pay: String) {
        val map = HashMap<String, String>()
        map["orderId"] = orderId
        map["orderType"] = orderType
        map["pay"] = pay
        channel.invokeMethod("paySuccess", map)
    }
    
    fun openOrderListWillPay(   orderType:String ){
        val map = HashMap<String, String>()
        map["orderType"] = orderType
        channel.invokeMethod("openOrderList", map)
    }

    fun openHome() {
        channel.invokeMethod("openHome",  null)
    }

    fun  payFailed(orderId: String, orderType: String, pay: String ,errorCode :String ,errorMessage:String){

        val map = HashMap<String, String>()
        map["orderId"] = orderId
        map["orderType"] = orderType
        map["errorCode"] = errorCode
        map["errorMessage"] = errorMessage
        map["pay"] = pay
        channel.invokeMethod("payFailed", map)
    }


    companion object {
        @JvmStatic
        fun create(context: Context, flutterEngine: FlutterEngine) {
            if (i == null) {
                i = LocalPlugin(context, flutterEngine)
            }
        }

        @JvmStatic
        fun instance(): LocalPlugin {
            if (i == null) {
                throw RuntimeException("Mast call create(context: Context,flutterEngine: FlutterEngine) first!")
            } else {
                return i!!
            }
        }

        private var i: LocalPlugin? = null

    }

}