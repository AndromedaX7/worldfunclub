package com.ds.worldfunclub.ui.activity.settings.security

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.systemPermission
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSystemPermissionComponent
import com.ds.worldfunclub.di.module.SystemPermissionModule
import com.ds.worldfunclub.viewmodel.SystemPermissionModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午11:52
 */

@Route(path = systemPermission)
class SystemPermissionActivity : BaseActivity<SystemPermissionModel>() {
    override fun layoutId() = R.layout.activity_settings_permission

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerSystemPermissionComponent.builder()
            .appComponent(appComponent)
            .systemPermissionModule(SystemPermissionModule(this))
            .build()
            .linked(this)
    }
}
