package com.ds.worldfunclub.ui.activity.goods

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.newAddressActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerNewAddressComponent
import com.ds.worldfunclub.di.module.NewAddressModule
import com.ds.worldfunclub.responsebean.AddressData
import com.ds.worldfunclub.viewmodel.NewAddressModel

/**
 * @Author tachibanako
 * @Date 2020/7/15 下午2:56
 */

@Route(path = newAddressActivity)
class NewAddressActivity : BaseActivity<NewAddressModel>() {
    override fun layoutId() = if (intent.getBooleanExtra("modify", false))
        R.layout.activity_modify_address
    else
        R.layout.activity_new_address

    @JvmField
    @Autowired
    var modify=false

    @JvmField
    @Autowired
    var data: AddressData.DataBean?=null

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerNewAddressComponent.builder()
                .appComponent(appComponent)
                .newAddressModule(NewAddressModule(this))
                .build()
                .linked(this)
    }
}
