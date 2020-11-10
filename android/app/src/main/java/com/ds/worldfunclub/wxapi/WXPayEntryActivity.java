package com.ds.worldfunclub.wxapi;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;

import androidx.annotation.Nullable;

import com.tencent.mm.opensdk.modelbase.BaseReq;
import com.tencent.mm.opensdk.modelbase.BaseResp;
import com.tencent.mm.opensdk.modelmsg.SendAuth;
import com.tencent.mm.opensdk.modelpay.PayReq;
import com.tencent.mm.opensdk.modelpay.PayResp;
import com.tencent.mm.opensdk.openapi.IWXAPIEventHandler;
import com.tencent.mm.opensdk.openapi.WXAPIFactory;

import java.util.ArrayList;
import java.util.Arrays;


public class WXPayEntryActivity extends Activity implements IWXAPIEventHandler {

//    public static void setExtData(PayReq req, String orderId, GoodsType orderType, String pay) {
//        req.extData = orderId + "<->" + orderType.getValue() + "<->" + pay;
//    }

    public static ArrayList<String> getExtData(PayResp resp) {
        return new ArrayList<>(Arrays.asList(resp.extData.split("<->")));
    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        Log.e("微信", getIntent().toString());
        WXAPIFactory.createWXAPI(this, "wx43736892a139b092").handleIntent(getIntent(), this);
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Log.e("微信", intent.toString());
        WXAPIFactory.createWXAPI(this, "wx43736892a139b092").handleIntent(getIntent(), this);
    }

    @Override
    public void onReq(BaseReq baseReq) {

    }

    @Override
    public void onResp(BaseResp baseResp) {

        int type = baseResp.getType();
        switch (type) {
            case 1:
//                if (baseResp.errCode == 0) {
//                    SendAuth.Resp r = (SendAuth.Resp) baseResp;
//                    ARouter.getInstance().build(login).withInt(LoginActivity.key_state, LoginActivity.wechat_success).withString(key_auth_wechat_code, r.code).navigation();
//                } else {
//                    ARouter.getInstance().build(login).withInt(LoginActivity.key_state, LoginActivity.wechat_failed).navigation();
//                }
                break;
            case 5: {
                switch (baseResp.errCode) {
                    case 0:
                        ArrayList<String> extData = getExtData((PayResp) baseResp);
//                  -->      ARouter.getInstance().build(main).navigation(this);
//                  -->   ARouter.getInstance().build(paySuccess).withString("orderId", extData.get(0)).withString("orderType", extData.get(1)).withString("pay", extData.get(2)).navigation(this);

                        break;
                    case -1:
//                        new AlertDialog.Builder(this)
//                                .setTitle("支付失败")
//                                .setCancelable(false)
//                                .setMessage(baseResp.errStr)
//                                .setPositiveButton("回到订单", (dialogInterface, i) -> {
//                                    ARouter.getInstance().build(main).navigation(this);
//                                    ARouter.getInstance().build(orderList).withInt("state", 1).navigation(this);
//                                    finishPostDelay();
//                                })
//                                .create()
//                                .show();
                        break;
                    case -2:
//                        new AlertDialog.Builder(this)
//                                .setTitle("订单未支付")
//                                .setCancelable(false)
//                                .setMessage(baseResp.errStr)
//                                .setPositiveButton("查看订单", (dialogInterface, i) -> {
//                                    ARouter.getInstance().build(main).navigation(this);
//                                    ARouter.getInstance().build(orderList).withInt("state", 1).navigation(this);
//                                    finishPostDelay();
//                                })
//                                .setNegativeButton("取消支付", (d, i) -> {
//                                    ARouter.getInstance().build(main).navigation(this);
//                                    finishPostDelay();
//                                })
//                                .create()
//                                .show();

                        break;
                }
            }
            break;
            default:
        }
    }

    private void finishPostDelay() {
        new Handler().postDelayed(this::finish, 1500);
    }
}
