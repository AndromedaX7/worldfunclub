package com.ds.worldfunclub.ui.activity.settings.security

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.modifyPayPassword
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerModifyPayPasswordComponent
import com.ds.worldfunclub.di.module.ModifyPayPasswordModule
import com.ds.worldfunclub.viewmodel.ModifyPayPasswordModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:12
 */

@Route(path = modifyPayPassword)
class ModifyPayPasswordActivity : BaseActivity<ModifyPayPasswordModel>() {
    override fun layoutId() = R.layout.activity_modify_pay_password

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerModifyPayPasswordComponent.builder()
            .appComponent(appComponent)
            .modifyPayPasswordModule(ModifyPayPasswordModule(this))
            .build()
            .linked(this)
    }
}
