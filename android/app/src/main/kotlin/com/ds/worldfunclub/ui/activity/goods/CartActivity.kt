package com.ds.worldfunclub.ui.activity.goods

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.cartActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCartComponent
import com.ds.worldfunclub.di.module.CartModule
import com.ds.worldfunclub.viewmodel.CartModel

/**
 * @Author tachibanako
 * @Date 2020/7/16 下午1:56
 */

@Route(path = cartActivity)
class CartActivity : BaseActivity<CartModel>() {
    override fun layoutId() = R.layout.activity_cart

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerCartComponent.builder()
            .appComponent(appComponent)
            .cartModule(CartModule(this))
            .build()
            .linked(this)
    }
}
