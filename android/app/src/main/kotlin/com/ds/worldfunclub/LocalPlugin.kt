package com.ds.worldfunclub

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.widget.Toast
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.room.LoginInfoEntry
import com.ds.worldfunclub.wxapi.WXPayEntryActivity
import com.google.zxing.client.android.CaptureActivity
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
            "startActivityByClass" -> {
                val route = call.argument<String>("className") ?: ""
                val args = call.argument<Map<String, String>>("args")
                App.app!!.wxInfo = LoginInfoEntry()
                val info = App.app!!.wxInfo!!
                info.user_id = call.argument<String>("userId")!!
                info.login_token = call.argument<String>("token")!!
                val intent = Intent(context, Class.forName(route))
                args?.forEach {
                    intent.putExtra(it.key, it.value)
                }
                context.startActivity(intent)
                result.success(null);
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
                result.success(null);
            }

            "startActivityWithUrl" -> {
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse(call.arguments as String)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                ContextCompat.startActivity(context, intent, null)
                result.success(null);
            }
            "callPhone" -> {
                val intent = Intent(Intent.ACTION_CALL, Uri.parse("tel://${call.arguments as String}")).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                ContextCompat.startActivity(context, intent, null)
                result.success(null);
            }
            "scan" -> {
                if (ContextCompat.checkSelfPermission(context, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED) {
                    CaptureActivity.scan(context as Activity)
                } else {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        CaptureActivity.scan(context as Activity)
                    } else {
                        ActivityCompat.requestPermissions(context as Activity, arrayOf(Manifest.permission.CAMERA), 100)
                    }
                }
                result.success(null);
            }

            "openLocation" -> {
                openLocalLocation(call.argument<Double>("lat") ?: 0.0,
                        call.argument<Double>("lon") ?: 0.0,
                        call.argument<String>("name") ?: "")
                result.success(null);
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

    fun openOrderListWillPay(orderType: String) {
        val map = HashMap<String, String>()
        map["orderType"] = orderType
        channel.invokeMethod("openOrderList", map)
    }

    fun openHome() {
        channel.invokeMethod("openHome", null)
    }

    fun payFailed(orderId: String, orderType: String, pay: String, errorCode: String, errorMessage: String) {

        val map = HashMap<String, String>()
        map["orderId"] = orderId
        map["orderType"] = orderType
        map["errorCode"] = errorCode
        map["errorMessage"] = errorMessage
        map["pay"] = pay
        channel.invokeMethod("payFailed", map)
    }


    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == CaptureActivity.SCAN_REQUEST && resultCode == Activity.RESULT_OK) {
            channel.invokeMethod("scanResult", data?.getStringExtra("data"))
        }
    }

    fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        if (requestCode == 100 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
            CaptureActivity.scan(context as Activity)
        }

    }


    private fun openLocalLocation(dlat: Double, dlon: Double, dname: String) {
        if (checkMapAppsIsExist(context, "com.autonavi.minimap")) {
            openGaoDeMap(dlat, dlon, dname)
        } else if (checkMapAppsIsExist(context, "com.baidu.BaiduMap")) {
            openBaiduMap(dlat, dlon, dname)
        } else {
            openTencent(dlat, dlon, dname)
        }
    }

    /**
     * 打开高德地图（公交出行，起点位置使用地图当前位置）
     *
     * t = 0（驾车）= 1（公交）= 2（步行）= 3（骑行）= 4（火车）= 5（长途客车）
     *
     * @param dlat  终点纬度
     * @param dlon  终点经度
     * @param dname 终点名称
     */

    private fun openGaoDeMap(dlat: Double, dlon: Double, dname: String) {
        if (checkMapAppsIsExist(context, "com.autonavi.minimap")) {
            val intent = Intent(Intent.ACTION_VIEW)
            intent.setPackage("com.autonavi.minimap")
            intent.addCategory("android.intent.category.DEFAULT")
            intent.data = Uri.parse("androidamap://route?sourceApplication=" + com.ds.worldfunclub.R.string.app_name
                    .toString() + "&sname=我的位置&dlat=" + dlat
                    .toString() + "&dlon=" + dlon
                    .toString() + "&dname=" + dname + "&dev=0&m=0&t=1")
            context.startActivity(intent)
        } else {
            Toast.makeText(context, "高德地图未安装", Toast.LENGTH_SHORT).show()
        }
    }

    /** 打开百度地图（公交出行，起点位置使用地图当前位置）
     *
     * mode = transit（公交）、driving（驾车）、walking（步行）和riding（骑行）. 默认:driving
     * 当 mode=transit 时 ： sy = 0：推荐路线 、 2：少换乘 、 3：少步行 、 4：不坐地铁 、 5：时间短 、 6：地铁优先
     *
     * @param dlat  终点纬度
     * @param dlon  终点经度
     * @param dname 终点名称
     */
    private fun openBaiduMap(dlat: Double, dlon: Double, dname: String) {
        if (checkMapAppsIsExist(context, "com.baidu.BaiduMap")) {
            val intent = Intent(Intent.ACTION_VIEW)
            intent.data = Uri.parse("baidumap://map/direction?origin=我的位置&destination=name:"
                    + dname
                    + "|latlng:" + dlat + "," + dlon
                    + "&mode=transit&sy=3&index=0&target=1")
            context.startActivity(intent)
        } else {
            Toast.makeText(context, "百度地图未安装", Toast.LENGTH_SHORT).show()
        }
    }

    /**
     * 打开腾讯地图（公交出行，起点位置使用地图当前位置）
     *
     * 公交：type=bus，policy有以下取值
     * 0：较快捷 、 1：少换乘 、 2：少步行 、 3：不坐地铁
     * 驾车：type=drive，policy有以下取值
     * 0：较快捷 、 1：无高速 、 2：距离短
     * policy的取值缺省为0
     *
     * @param dlat  终点纬度
     * @param dlon  终点经度
     * @param dname 终点名称
     */
    private fun openTencent(dlat: Double, dlon: Double, dname: String) {
        if (checkMapAppsIsExist(context, "com.tencent.map")) {
            val intent = Intent(Intent.ACTION_VIEW)
            intent.data = Uri.parse("qqmap://map/routeplan?type=bus&from=我的位置&fromcoord=0,0"
                    + "&to=" + dname
                    + "&tocoord=" + dlat + "," + dlon
                    + "&policy=1&referer=myapp")
            context.startActivity(intent)
        } else {
            Toast.makeText(context, "腾讯地图未安装", Toast.LENGTH_SHORT).show()
        }
    }

    fun checkMapAppsIsExist(context: Context, packagename: String?): Boolean {
        var packageInfo: PackageInfo?
        try {
            packageInfo = context.packageManager.getPackageInfo(packagename!!, 0)
        } catch (e: Exception) {
            packageInfo = null
            e.printStackTrace()
        }
        return packageInfo != null
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