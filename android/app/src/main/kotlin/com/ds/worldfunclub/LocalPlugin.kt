package com.ds.worldfunclub

import android.content.Context
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.room.LoginInfoEntry
import com.tencent.mm.opensdk.modelmsg.SendAuth
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
                info.user_id=call.argument<String>("userId")!!
                info.login_token=call.argument<String>("token")!!

                val navigation = ARouter.getInstance().build(route)
                args?.forEach {
                    navigation.withString(it.key, it.value)
                }
                navigation.navigation()
            }
        }
    }

    fun responseWechatCode(code: String) {
        channel.invokeMethod("wechatCodeResponse", code)
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