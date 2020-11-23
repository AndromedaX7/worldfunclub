package com.ds.worldfunclub.ui.activity.live.casual

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.casualHome
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCasualHomeComponent
import com.ds.worldfunclub.di.module.CasualHomeModule
import com.ds.worldfunclub.viewmodel.CasualHomeModel

/**
 * @Author 12031
 * @Date 2020/8/19 12:44
 */
@Route(path = casualHome)
class CasualHomeActivity : BaseActivity<CasualHomeModel>() {
    override fun layoutId(): Int {
        return R.layout.activity_casual_list
    }

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerCasualHomeComponent.builder()
            .appComponent(appComponent)
            .casualHomeModule(CasualHomeModule(this))
            .build()
            .linked(this)
    }
}