package com.ds.worldfunclub.ui.activity.login

import android.app.Activity
import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.bindPhone
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerBindPhoneComponent
import com.ds.worldfunclub.di.module.BindPhoneModule
import com.ds.worldfunclub.viewmodel.BindPhoneModel

/**
 * @Author mi
 * @Date 2020/8/19 3:22 PM
 */
@Route(path = bindPhone)
class BindPhoneActivity : BaseActivity<BindPhoneModel>() {
    override fun layoutId() = R.layout.activity_bind_phone

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerBindPhoneComponent.builder()
            .appComponent(appComponent)
            .bindPhoneModule(BindPhoneModule(this))
            .build()
            .linked(this)
    }

    override fun onBackPressed() {
        setResult(Activity.RESULT_CANCELED)
        super.onBackPressed()
    }
}
