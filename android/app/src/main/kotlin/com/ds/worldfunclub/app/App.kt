package com.ds.worldfunclub.app

import android.app.Application
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BuildConfig
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerAppComponent
import com.ds.worldfunclub.di.module.AppModule
import com.ds.worldfunclub.di.module.NetworkModule
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.room.LoginInfoEntry

//import com.mob.MobSDK

class App : Application() {
    var reLogin: Boolean = false
    var wxInfo: LoginInfoEntry? = null
    var liveCategory = ArrayList<HomeCategory.DataBean>()

    lateinit var appComponent: AppComponent
    override fun onCreate() {
        super.onCreate()
        app = this
        ARouter.init(this)
//        MobSDK.init(this)
//        MobSDK.submitPolicyGrantResult(true, null)
        if (BuildConfig.DEBUG) {
            ARouter.openDebug()
            ARouter.openLog()
        }
        appComponent = DaggerAppComponent
                .builder()
                .appModule(AppModule(this))
                .networkModule(NetworkModule())
                .build()

    }


    companion object {
        var app: App? = null
        fun app(): App? {
            return app
        }
    }
}