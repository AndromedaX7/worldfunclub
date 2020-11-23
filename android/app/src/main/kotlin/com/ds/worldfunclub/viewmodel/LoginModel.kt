package com.ds.worldfunclub.viewmodel

import android.app.Activity
import android.content.Intent
import android.util.Log
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityOptionsCompat
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.bindPhone
import com.ds.worldfunclub.app.main
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.saveInfo
import com.ds.worldfunclub.base.saveToken
import com.ds.worldfunclub.base.toast
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.pair
import com.ds.worldfunclub.ui.activity.MainActivity
import com.ds.worldfunclub.ui.activity.login.LoginActivity.Companion.key_auth_wechat_code
import com.ds.worldfunclub.ui.activity.login.LoginActivity.Companion.key_state
import com.ds.worldfunclub.ui.activity.login.LoginActivity.Companion.wechat_failed
import com.ds.worldfunclub.ui.activity.login.LoginActivity.Companion.wechat_success
import com.tencent.mm.opensdk.modelmsg.SendAuth
import com.tencent.mm.opensdk.openapi.WXAPIFactory
import javax.inject.Inject


/**
 * @Author nekoneko
 * @Date 2020/7/25 下午3:51
 */
@ActivityScope
class LoginModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    private var tag = "LoginModel"
    private val bindPhoneRequestCode = 1
    private val loginPhoneRequestCode = 2
//    fun withoutLogin() {
//        ARouter.getInstance().build(main).navigation()
//        activity.finishAfterTransition()
//    }

    fun loginWechat() {
        val api = WXAPIFactory.createWXAPI(activity, "wx43736892a139b092")
        val req = SendAuth.Req()
        req.scope = "snsapi_userinfo"
        req.state = "wechat_login_world_fun_club"
        api.sendReq(req)
    }

    fun listenRecreate(intent: Intent?) {
        when (intent?.getIntExtra(key_state, 0)) {
            wechat_success -> {
                rxLifeScope.launch {
                    val wxInfo = api.uploadWechatAuthCode(
                        intent.getStringExtra(key_auth_wechat_code) ?: ""
                    )

                    Log.e("Login", "--->${wxInfo.data.user_id.toString()}")
                    when (wxInfo.code) {
                        1 -> {
                            app.wxInfo = wxInfo.data
                            activity.saveInfo(wxInfo.data)
                            activity.saveToken(wxInfo.data.login_token)
                            if (wxInfo.data.user_mobilebind == "1") {
                                Log.e("launchbefore", Thread.currentThread().name)

                                wxInfo.data.user_mobilebind = "1"
                                activity.saveInfo(wxInfo.data)
                                activity.startActivity(
                                    Intent(
                                        activity,
                                        MainActivity::class.java
                                    ).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                                )
                                Log.e("launchafter", "========")
                                activity.finishAfterTransition()
                            } else {
                                ARouter.getInstance().build(bindPhone)
                                    .navigation(activity, bindPhoneRequestCode)
                            }

                        }
                        else ->
                            activity.toast(wxInfo.message)
                    }
                }
            }
            wechat_failed -> {

            }
        }
    }

    fun loginPhone(v: View) {
        val root = activity.window.decorView
        val bundle = ActivityOptionsCompat.makeSceneTransitionAnimation(
            activity,
            activity.pair(root.findViewById(R.id.logo), R.string.tran_home_logo),
            activity.pair(root.findViewById(R.id.title), R.string.tran_home_title),
            activity.pair(root.findViewById(R.id.content), R.string.tran_home_content)
        )
        ARouter.getInstance().build(com.ds.worldfunclub.app.loginPhone).withOptionsCompat(bundle)
            .navigation(activity, loginPhoneRequestCode)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            bindPhoneRequestCode -> {
                if (resultCode == Activity.RESULT_OK) {
                    Log.e(tag, "Activity.RESULT_OK")
                    activity.saveToken(app.wxInfo!!.login_token)
                    rxLifeScope.launch {
                        app.wxInfo!!.user_mobilebind = "1"
                        activity.saveInfo(app.wxInfo!!)
                    }

                    ARouter.getInstance().build(main).navigation()
                    activity.finishAfterTransition()
                } else {
                    Log.e(tag, "OTHER")
                }
            }
            loginPhoneRequestCode -> {
                if (resultCode == Activity.RESULT_OK) {
                    Log.e(tag, "Activity.RESULT_OK")
                    activity.finishAfterTransition()
                }
            }
        }

    }
}
