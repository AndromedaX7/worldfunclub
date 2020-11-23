package com.ds.worldfunclub.ui.activity.mine

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.myCollection
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMyCollectionComponent
import com.ds.worldfunclub.di.module.MyCollectionModule
import com.ds.worldfunclub.viewmodel.MyCollectionModel

/**
 * @Author tachibanako
 * @Date 2020/7/22 下午12:08
 */
@Route(path = myCollection)
class MyCollectionActivity : BaseActivity<MyCollectionModel>() {
    override fun layoutId() = R.layout.activity_my_collection

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerMyCollectionComponent.builder()
            .appComponent(appComponent)
            .myCollectionModule(MyCollectionModule(this))
            .build()
            .linked(this)
    }
}
