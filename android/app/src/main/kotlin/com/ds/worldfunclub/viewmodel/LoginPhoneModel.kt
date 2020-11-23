package com.ds.worldfunclub.viewmodel

import android.app.Activity
import android.content.Intent
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
import com.ds.worldfunclub.base.saveInfo
import com.ds.worldfunclub.base.saveToken
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.MainActivity
import com.ds.worldfunclub.validate.ValidatePhone
import com.ds.worldfunclub.validate.ValidatePhoneWithCode
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/8/21 下午2:38
 */
@ActivityScope
class LoginPhoneModel @Inject constructor(
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
        ValidatePhone(phone, activity).validate {
            vCodeState = true
            val text = v as TextView
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
                    api.smsCodeLogin(phone)
                toast(smsCode.toastMsg())
            }
        }

    }

    fun login() {
        ValidatePhoneWithCode(phone, code, activity).validate {
            rxLifeScope.launch {
                val res = api.login(phone, code)
                toast(res.toastMsg())
                if (res.code == 1) {
                    app.wxInfo = res.data
                    activity.saveInfo(res.data)
                    activity.saveToken(res.data.login_token)
                    Log.e("dao op update", "true")
                    activity.startActivity(
                        Intent(activity, MainActivity::class.java).addFlags(
                            Intent.FLAG_ACTIVITY_NEW_TASK
                        )
                    )
                    activity.setResult(Activity.RESULT_OK)
                    activity.finishAfterTransition()

                }
                cd?.onFinish()
                cd?.cancel()
            }
        }


    }
}

