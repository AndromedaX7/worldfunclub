package com.ds.worldfunclub.ui.activity.settings.security

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.modifyPayPasswordConfirm
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerModifyPayPasswordConfirmComponent
import com.ds.worldfunclub.di.module.ModifyPayPasswordConfirmModule
import com.ds.worldfunclub.viewmodel.ModifyPayPasswordConfirmModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:32
 */

@Route(path = modifyPayPasswordConfirm)
class ModifyPayPasswordConfirmActivity : BaseActivity<ModifyPayPasswordConfirmModel>() {
    override fun layoutId() = R.layout.activity_modify_pay_password_confirm

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerModifyPayPasswordConfirmComponent.builder()
            .appComponent(appComponent)
            .modifyPayPasswordConfirmModule(ModifyPayPasswordConfirmModule(this))
            .build()
            .linked(this)
    }
}
