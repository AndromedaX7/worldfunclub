package com.ds.worldfunclub.ui.activity.login

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.loginPhone
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerLoginPhoneComponent
import com.ds.worldfunclub.di.module.LoginPhoneModule
import com.ds.worldfunclub.viewmodel.LoginPhoneModel

/**
 * @Author nekoneko
 * @Date 2020/8/21 下午2:37
 */
@Route(path = loginPhone )
class LoginPhoneActivity : BaseActivity<LoginPhoneModel>() {
    override fun layoutId() = R.layout.activity_login_phone

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerLoginPhoneComponent.builder()
            .appComponent(appComponent)
            .loginPhoneModule(LoginPhoneModule(this))
            .build()
            .linked(this)
    }
}