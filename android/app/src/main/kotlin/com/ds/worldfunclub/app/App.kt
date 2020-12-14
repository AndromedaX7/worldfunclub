package com.ds.worldfunclub.app

import android.app.Application
import com.ds.worldfunclub.BuildConfig
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerAppComponent
import com.ds.worldfunclub.di.module.AppModule
import com.ds.worldfunclub.di.module.NetworkModule
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.room.LoginInfoEntry

//import com.mob.MobSDK

class App : Application() {
    var wxInfo: LoginInfoEntry? = null

    lateinit var appComponent: AppComponent
    override fun onCreate() {
        super.onCreate()
        app = this
//        MobSDK.init(this)
//        MobSDK.submitPolicyGrantResult(true, null)
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