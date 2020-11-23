package com.ds.worldfunclub.viewmodel

import android.app.Activity
import android.os.CountDownTimer
import android.util.Log
import android.view.View
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.validate.ValidatePhone
import com.ds.worldfunclub.validate.ValidatePhoneWithCode
import javax.inject.Inject

/**
 * @Author mi
 * @Date 2020/8/19 3:23 PM
 */
@ActivityScope
class BindPhoneModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    var cd: CountDownTimer? = null

    @get:Bindable
    var vCodeState = false
        set(value) {
            field = value
            notifyPropertyChanged(BR.vCodeState)
        }

    @get:Bindable
    var phone = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.phone)
        }

    @get:Bindable
    var code = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.code)
        }

    fun cleanPhone() {
        phone = ""
    }

    fun sendCode(v: View) {
        if (app.wxInfo == null) {
            return
        }
        ValidatePhone(phone,activity ).validate {
            val text = v as TextView
            app.wxInfo?.let {
                vCodeState = true
                rxLifeScope.launch {
                    cd = object : CountDownTimer(
                        60_000L,
                        1000L
                    ) {
                        override fun onFinish() {
                            vCodeState = false
                            text.text = "获取验证码"

                        }

                        override fun onTick(millisUntilFinished: Long) {
                            Log.e("text", "time-> $millisUntilFinished  ${Thread.currentThread().name}")
                            text.text = "${millisUntilFinished / 1000}s后重发"
                        }

                    }
                    cd?.start()
                    val smsCode =
                        api.smsCodeBindPhoneAccount(it.user_id, phone, it.login_token)
                    toast(smsCode.toastMsg())
                }
            }
        }
    }

    fun bindPhone() {
        app.wxInfo?.let {
            ValidatePhoneWithCode(phone, code, context).validate {
                rxLifeScope.launch {
                    val res = api.userBindMobile(it.user_id, phone, it.login_token, code)
                    toast(res.toastMsg())
                    if (res.code == 1) {
                        activity.setResult(Activity.RESULT_OK)
                        activity.finishAfterTransition()
                    }
                    cd?.onFinish()
                    cd?.cancel()
                }
            }
        }
    }
}