package com.ds.worldfunclub.ui.activity.goods

import android.graphics.Color
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerGoodsDetailsComponent
import com.ds.worldfunclub.di.module.GoodsDetailsModule
import com.ds.worldfunclub.viewmodel.GoodsDetailsModel

/**
 * @Author 12031
 * @Date 2020/7/9 15:17
 */
class GoodsDetailsActivity : BaseActivity<GoodsDetailsModel>() {
    override fun layoutId() = R.layout.activity_goods_details

    @JvmField
    var goodsId = ""

    @JvmField
    var discountId = ""
    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerGoodsDetailsComponent.builder()
                .appComponent(appComponent)
                .goodsDetailsModule(GoodsDetailsModule(this))
                .build()
                .linked(this)
    }
}
