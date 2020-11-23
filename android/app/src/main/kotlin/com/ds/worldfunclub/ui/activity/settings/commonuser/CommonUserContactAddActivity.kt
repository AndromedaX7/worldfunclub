package com.ds.worldfunclub.ui.activity.settings.commonuser

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.commonUserContactAdd
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCommonUserContactAddComponent
import com.ds.worldfunclub.di.module.CommonUserContactAddModule
import com.ds.worldfunclub.viewmodel.CommonUserContactAddModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:20
 */

@Route(path = commonUserContactAdd)
class CommonUserContactAddActivity : BaseActivity<CommonUserContactAddModel>() {
    override fun layoutId() = R.layout.activity_commonly_used_contact_add

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerCommonUserContactAddComponent.builder()
            .appComponent(appComponent)
            .commonUserContactAddModule(CommonUserContactAddModule(this))
            .build()
            .linked(this)
    }
}
