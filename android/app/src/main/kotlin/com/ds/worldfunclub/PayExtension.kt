package com.ds.worldfunclub

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.content.Intent
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.wxapi.WXPayEntryActivity
import com.hailong.biometricprompt.fingerprint.FingerprintCallback
import com.hailong.biometricprompt.fingerprint.FingerprintVerifyManager
import com.tencent.mm.opensdk.modelpay.PayReq
import com.tencent.mm.opensdk.openapi.WXAPIFactory


fun wechatPay(
    context: Context,
    prepayId: String,
    timeStamp: String,
    nonceStr: String,
    sign: String,
    orderId:String,
    payMoney:String,
    goodsType: GoodsType
) {
    val api = WXAPIFactory.createWXAPI(context, null)
    val request = PayReq()
    WXPayEntryActivity.setExtData(request,orderId,goodsType ,payMoney)
    request.appId = "wx43736892a139b092"
    request.partnerId = "1602989977"
    request.prepayId = prepayId
    request.packageValue = "Sign=WXPay"
    request.nonceStr = nonceStr
    request.timeStamp = timeStamp
    request.sign = sign
    api.sendReq(request)
}

//app_id=2015052600090779&biz_content=%7B%22timeout_express%22%3A%2230m%22%2C%22seller_id%22%3A%22%22%2C%22product_code%22%3A%22QUICK_MSECURITY_PAY%22%2C%22total_amount%22%3A%220.02%22%2C%22subject%22%3A%221%22%2C%22body%22%3A%22%E6%88%91%E6%98%AF%E6%B5%8B%E8%AF%95%E6%95%B0%E6%8D%AE%22%2C%22out_trade_no%22%3A%22314VYGIAGG7ZOYY%22%7D&charset=utf-8&method=alipay.trade.app.pay&sign_type=RSA2&timestamp=2016-08-15%2012%3A12%3A15&version=1.0&sign=MsbylYkCzlfYLy9PeRwUUIg9nZPeN9SfXPNavUCroGKR5Kqvx0nEnd3eRmKxJuthNUx4ERCXe552EV9PfwexqW%2B1wbKOdYtDIb4%2B7PL3Pc94RZL0zKaWcaY3tSL89%2FuAVUsQuFqEJdhIukuKygrXucvejOUgTCfoUdwTi7z%2BZzQ%3D
//suspend fun alipay(activity: AppCompatActivity, orderInfo: String): Map<String, String> {
//    val alipay = PayTask(activity)
//    return alipay.payV2(orderInfo, true)
//}

//fun paySelf(activity: AppCompatActivity) {
//    FingerprintVerifyManager.Builder(activity)
//        .callback(FingerprintCallbackSelfPay(activity))
//        .enableAndroidP(true)
//        .cancelBtnText("取消")
//        .fingerprintColor(ContextCompat.getColor(activity, R.color.colorAccent))
//        .build()
//}

//class FingerprintCallbackSelfPay(val context: Context) : FingerprintCallback {
//    override fun onSucceeded() {
//        Toast.makeText(
//            context,
//            context.getString(R.string.biometricprompt_verify_success),
//            Toast.LENGTH_SHORT
//        ).show()
//    }
//
//    override fun onFailed() {
//        Toast.makeText(
//            context,
//            context.getString(R.string.biometricprompt_verify_failed),
//            Toast.LENGTH_SHORT
//        ).show()
//    }
//
//    override fun onUsepwd() {
//        Toast.makeText(
//            context,
//            context.getString(R.string.fingerprint_usepwd),
//            Toast.LENGTH_SHORT
//        ).show()
//    }
//
//    override fun onCancel() {
//        Toast.makeText(
//            context,
//            context.getString(R.string.fingerprint_cancel),
//            Toast.LENGTH_SHORT
//        ).show()
//    }
//
//    override fun onHwUnavailable() {
//        Toast.makeText(
//            context,
//            context.getString(R.string.biometricprompt_finger_hw_unavailable),
//            Toast.LENGTH_SHORT
//        ).show()
//    }
//
//    override fun onNoneEnrolled() {
//        //弹出提示框，跳转指纹添加页面
//        val builder = AlertDialog.Builder(context)
//        builder.setTitle(context.getString(R.string.biometricprompt_tip))
//            .setMessage(context.getString(R.string.biometricprompt_finger_add))
//            .setCancelable(false)
//            .setNegativeButton(context.getString(R.string.biometricprompt_finger_add_confirm),
//                DialogInterface.OnClickListener { _: DialogInterface?, _: Int ->
//                    context.startActivity(Intent("android.settings.BIOMETRIC_ENROLL"))
//                })
//            .setPositiveButton(
//                context.getString(R.string.biometricprompt_cancel),
//                (DialogInterface.OnClickListener { dialog: DialogInterface, which: Int -> dialog.dismiss() })
//            )
//            .create().show()
//    }
//
//
//}