package com.ds.worldfunclub.ui.activity.settings.security

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.modifyPhoneNumberConfirm
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerModifyPhoneConfirmComponent
import com.ds.worldfunclub.di.module.ModifyPhoneConfirmModule
import com.ds.worldfunclub.viewmodel.ModifyPhoneConfirmModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:39
 */

@Route(path = modifyPhoneNumberConfirm)
class ModifyPhoneConfirmActivity : BaseActivity<ModifyPhoneConfirmModel>() {
    override fun layoutId() = R.layout.activity_modify_phone_confirm

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerModifyPhoneConfirmComponent.builder()
            .appComponent(appComponent)
            .modifyPhoneConfirmModule(ModifyPhoneConfirmModule(this))
            .build()
            .linked(this)
    }
}
