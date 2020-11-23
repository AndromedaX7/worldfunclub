package com.ds.worldfunclub.ui.activity

import android.graphics.Color
import android.os.Handler
import android.util.Log
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.login
import com.ds.worldfunclub.app.main
import com.ds.worldfunclub.base.*
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSplashComponent
import com.ds.worldfunclub.di.module.SplashModule
import com.ds.worldfunclub.viewmodel.SplashModel


/**
 * @Authod 12031
 * @Date 2020/7/4 11:02
 */
class SplashActivity : BaseActivity<SplashModel>() {
    override fun layoutId() = R.layout.activity_splash

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerSplashComponent.builder()
            .appComponent(appComponent)
            .splashModule(SplashModule(this))
            .build()
            .linked(this)
    }

    override fun onResume() {
        super.onResume()

        if (hasToken()) {
            lifecycle.rxLifeScope.launch {
                val app = application as App
                app .wxInfo =loadInfo()
                if(app.wxInfo!=null){
                    Log.e("Wxinfo",app.wxInfo!!.user_mobilebind )
                    if(app.wxInfo!!.user_mobilebind =="1"){
                        ARouter.getInstance().build(main).navigation()
                        finish()
                    }else{
                        ARouter.getInstance().build(login).navigation()
                        finish()
                    }

                }else{
                    Log.e("shell","啥也没有")
                    ARouter.getInstance().build(login).navigation()
                    finish()
                }
            }
//TODO to last
//            if(hasRecord()){
//                if(System.currentTimeMillis() - recordTime() < AppConfiguration.USE_RECORD_TIME) {
//                    ARouter.getInstance().build(main).navigation()
//                    startActivity(Intent(this, Class.forName(recordName())))
//                    finish()
//                }else{
//                    cleanRecord()
//                }
//            }else{

//            }

        } else {
            Log.e("hello", "没得")
            Handler().postDelayed({
                ARouter.getInstance().build(login).navigation()
                finish()
            }, 2000)
        }
    }
}