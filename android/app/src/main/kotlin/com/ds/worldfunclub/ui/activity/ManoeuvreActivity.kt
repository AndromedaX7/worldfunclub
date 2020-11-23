package com.ds.worldfunclub.ui.activity

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.manoeuvre
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerManoeuvreComponent
import com.ds.worldfunclub.di.module.ManoeuvreModule
import com.ds.worldfunclub.viewmodel.ManoeuvreModel

/**
 * @Author 12031
 * @Date 2020/7/13 14:20
 */
@Route(path = manoeuvre)
class ManoeuvreActivity : BaseActivity<ManoeuvreModel>() {
    override fun layoutId() = R.layout.activity_manoeuvre

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerManoeuvreComponent.builder()
            .appComponent(appComponent)
            .manoeuvreModule(ManoeuvreModule(this))
            .build()
            .linked(this)
    }
}
