package com.ds.worldfunclub.ui.activity.mine

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.footprint
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMyFootprintComponent
import com.ds.worldfunclub.di.module.MyFootprintModule
import com.ds.worldfunclub.viewmodel.MyFootprintModel

/**
 * @Author nekoneko
 * @Date 2020/7/29 上午9:20
 */
@Route(path = footprint)
class MyFootprintActivity : BaseActivity<MyFootprintModel>() {
    override fun layoutId() = R.layout.activity_my_footpoint

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerMyFootprintComponent.builder()
            .appComponent(appComponent)
            .myFootprintModule(MyFootprintModule(this))
            .build()
            .linked(this)
    }
}