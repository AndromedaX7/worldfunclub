package com.ds.worldfunclub.ui.activity.homeentry

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.welfareOfNewComersActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerWelfareOfNewComersComponent
import com.ds.worldfunclub.di.module.WelfareOfNewComersModule
import com.ds.worldfunclub.viewmodel.WelfareOfNewComersModel

/**
 * @Author 12031
 * @Date 2020/7/14 13:32
 */


@Route(path = welfareOfNewComersActivity)
class WelfareOfNewComersActivity : BaseActivity<WelfareOfNewComersModel>() {
    override fun layoutId() = R.layout.activity_active_entry_0


    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerWelfareOfNewComersComponent.builder()
            .appComponent(appComponent)
            .welfareOfNewComersModule(WelfareOfNewComersModule(this))
            .build()
            .linked(this)
    }

    override fun onBackPressed() {
        finishAfterTransition()
    }
}
