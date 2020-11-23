package com.ds.worldfunclub.ui.activity.login

import android.annotation.TargetApi
import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.os.Build
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.login
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.toast
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerLoginComponent
import com.ds.worldfunclub.di.module.LoginModule
import com.ds.worldfunclub.viewmodel.LoginModel


/**
 * @Author nekoneko
 * @Date 2020/7/25 下午3:51
 */

@Route(path = login)
class LoginActivity : BaseActivity<LoginModel>() {

    companion object {
        const val wechat_success = 100
        const val wechat_failed = 101
        const val logout = 1
        const val key_state = "key_state"
        const val key_auth_wechat_code = "key_auth_wechat_code"
        const val key_option = "option"
        const val option_unused_back = 1
    }

    var canExit = false

    @JvmField
    @Autowired
    var option = 0
    override fun layoutId() = R.layout.activity_login

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerLoginComponent.builder()
            .appComponent(appComponent)
            .loginModule(LoginModule(this))
            .build()
            .linked(this)
        canExit = (application as App).reLogin
    }


    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)
        vm.listenRecreate(intent)
    }

    var last = 0L

    override fun onBackPressed() {
        if (canExit) {
            if (System.currentTimeMillis() - last > 2000) {
                toast("再按一次退出")
                last = System.currentTimeMillis()
            } else {
//                System.exit(0)
                exitAPP()
            }
        } else {
            when (option) {
                option_unused_back -> {
                }
                else ->
                    super.onBackPressed()
            }
        }


    }

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    private fun exitAPP() {
        val activityManager = getApplicationContext()
            .getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
        val appTaskList = activityManager.appTasks
        for (appTask in appTaskList) {
            appTask.finishAndRemoveTask()
        }
    }
}