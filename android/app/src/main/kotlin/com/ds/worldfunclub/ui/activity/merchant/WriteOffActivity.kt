package com.ds.worldfunclub.ui.activity.merchant

import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.writeOff
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerWriteOffComponent
import com.ds.worldfunclub.di.module.WriteOffModule
import com.ds.worldfunclub.viewmodel.WriteOffModel

/**
 * @Author miaom
 * @Date 2020/10/14 16:14
 */

@Route(path = writeOff)
class WriteOffActivity : BaseActivity<WriteOffModel>() {
    override fun layoutId() = R.layout.activity_writeoff

    override fun init(appComponent: AppComponent) {
        DaggerWriteOffComponent.builder()
            .appComponent(appComponent)
            .writeOffModule(WriteOffModule(this))
            .build()
            .linked(this)
    }

    @JvmField
    @Autowired
    var url =""
}