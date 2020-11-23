package com.ds.worldfunclub.ui.activity.goods

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.shopDetailsActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerShopDetailsComponent
import com.ds.worldfunclub.di.module.ShopDetailsModule
import com.ds.worldfunclub.viewmodel.ShopDetailsModel

/**
 * @Author 12031
 * @Date 2020/7/15 11:01
 */

@Route(path = shopDetailsActivity)
class ShopDetailsActivity : BaseActivity<ShopDetailsModel>() {
    override fun layoutId() =  R.layout.activity_shop_details

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerShopDetailsComponent.builder()
            .appComponent(appComponent)
            .shopDetailsModule(ShopDetailsModule(this))
            .build()
            .linked(this)
    }
}
