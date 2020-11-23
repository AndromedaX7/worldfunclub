package com.ds.worldfunclub.ui.activity.live

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerShopListComponent
import com.ds.worldfunclub.di.module.ShopListModule
import com.ds.worldfunclub.viewmodel.ShopListModel

/**
 * @Author nekoneko
 * @Date 2020/7/29 下午3:15
 */
class ShopListActivity : BaseActivity<ShopListModel>() {
    override fun layoutId() = R.layout.activity_live_shop_list

    override fun init(appComponent: AppComponent) {
        DaggerShopListComponent.builder()
            .appComponent(appComponent)
            .shopListModule(ShopListModule(this))
            .build()
            .linked(this)
    }
}