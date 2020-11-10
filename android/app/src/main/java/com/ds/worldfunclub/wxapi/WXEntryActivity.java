package com.ds.worldfunclub.wxapi;

import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.Nullable;

import com.ds.worldfunclub.LocalPlugin;
import com.tencent.mm.opensdk.modelbase.BaseReq;
import com.tencent.mm.opensdk.modelbase.BaseResp;
import com.tencent.mm.opensdk.modelmsg.SendAuth;
import com.tencent.mm.opensdk.openapi.IWXAPIEventHandler;
import com.tencent.mm.opensdk.openapi.WXAPIFactory;

public class WXEntryActivity extends cn.sharesdk.wechat.utils.WechatHandlerActivity implements IWXAPIEventHandler {

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
                if (baseResp.errCode == 0) {
                    SendAuth.Resp r = (SendAuth.Resp) baseResp;
                    Log.e("微信code",r.code);
                    LocalPlugin.instance().responseWechatCode(r.code);
//                    ARouter.getInstance().build(login).withInt(LoginActivity.key_state, LoginActivity.wechat_success).withString(key_auth_wechat_code, r.code).navigation();
                } else {
//                    ARouter.getInstance().build(login).withInt(LoginActivity.key_state, LoginActivity.wechat_failed).navigation();
                }
                break;
            case 5: {
                Log.d("Pay", "onPayFinish,errCode=" + baseResp.errCode);
                switch (baseResp.errCode) {
                    case 0:
                        new AlertDialog.Builder(this)
                                .setTitle("支付成功")
                                .setMessage("感谢您的购买！我们现在：")
                                .setPositiveButton("查看订单", (dialogInterface, i) -> {
//                                    ARouter.getInstance().build(orderList).withInt("state", 2).navigation(this);
//                                    finish();
                                })
                                .setNegativeButton("回到首页", (dialogInterface, i) -> {
//                                    ARouter.getInstance().build(main).navigation(this);
//                                    finish();
                                })
                                .create()
                                .show();
                        break;
                    case -1:
                        new AlertDialog.Builder(this)
                                .setTitle("支付失败")
                                .setMessage(baseResp.errStr)
                                .setPositiveButton("回到订单", (dialogInterface, i) -> {
//                                    ARouter.getInstance().build(orderList).withInt("state", 1).navigation(this);
//                                    finish();
                                })
                                .create()
                                .show();
                        break;
                    case -2:
//                        ARouter.getInstance().build(orderList).withInt("state", 1).navigation(this);
                        finish();
                        break;
                }
            }
            break;
            default:
        }


    }
}
