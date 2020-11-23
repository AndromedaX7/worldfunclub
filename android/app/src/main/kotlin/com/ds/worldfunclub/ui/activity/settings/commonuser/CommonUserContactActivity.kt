package com.ds.worldfunclub.ui.activity.settings.commonuser

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.commonUserContact
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCommonUserContactComponent
import com.ds.worldfunclub.di.module.CommonUserContactModule
import com.ds.worldfunclub.viewmodel.CommonUserContactModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 下午1:17
 */

@Route(path = commonUserContact)
class CommonUserContactActivity : BaseActivity<CommonUserContactModel>() {
    override fun layoutId() = R.layout.activity_commonly_used_contact

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerCommonUserContactComponent.builder()
            .appComponent(appComponent)
            .commonUserContactModule(CommonUserContactModule(this))
            .build()
            .linked(this)
    }
}
