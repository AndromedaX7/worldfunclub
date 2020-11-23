package com.ds.worldfunclub.ui.activity.settings.security

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.modifyPhoneNumber
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerModifyPhoneComponent
import com.ds.worldfunclub.di.module.ModifyPhoneModule
import com.ds.worldfunclub.viewmodel.ModifyPhoneModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:04
 */

@Route(path = modifyPhoneNumber)
class ModifyPhoneActivity : BaseActivity<ModifyPhoneModel>() {
    override fun layoutId() = R.layout.activity_modify_phone

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerModifyPhoneComponent.builder()
            .appComponent(appComponent)
            .modifyPhoneModule(ModifyPhoneModule(this))
            .build()
            .linked(this)
    }
}
