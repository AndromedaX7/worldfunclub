package com.ds.worldfunclub.ui.activity.goods

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.lastCategory
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerCategoryGoodsLastComponent
import com.ds.worldfunclub.di.module.CategoryGoodsLastModule
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.viewmodel.CategoryGoodsLastModel
import com.google.gson.Gson

/**
 * @Author miaom
 * @Date 2020/10/21 16:30
 */

@Route(path = lastCategory)
class CategoryGoodsLastActivity : BaseActivity<CategoryGoodsLastModel>() {
    override fun layoutId() = R.layout.activity_category_level_last

    @Autowired
    @JvmField
    var category: HomeCategory.DataBean.ChildBean?=null
    @Autowired
    @JvmField
    var category2:String =""

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerCategoryGoodsLastComponent.builder()
            .appComponent(appComponent)
            .categoryGoodsLastModule(CategoryGoodsLastModule(this))
            .build()
            .linked(this)
    }

    override fun initReady() {
        category= Gson().fromJson(category2, HomeCategory.DataBean.ChildBean::class.java)
        super.initReady()
    }


}