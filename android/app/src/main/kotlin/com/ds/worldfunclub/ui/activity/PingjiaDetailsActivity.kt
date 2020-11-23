package com.ds.worldfunclub.ui.activity

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.goodsPingjiaActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerPingjiaDetailsComponent
import com.ds.worldfunclub.di.module.PingjiaDetailsModule
import com.ds.worldfunclub.viewmodel.PingjiaDetailsModel

/**
 * @Author 12031
 * @Date 2020/7/10 14:33
 */

@Route(path = goodsPingjiaActivity)
class PingjiaDetailsActivity : BaseActivity<PingjiaDetailsModel>() {
    override fun layoutId() = R.layout.activity_goods_pingjia_details

    @Autowired
    @JvmField
    var goodsId = ""


    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerPingjiaDetailsComponent.builder()
            .appComponent(appComponent)
            .pingjiaDetailsModule(PingjiaDetailsModule(this))
            .build()
            .linked(this)
    }
}
