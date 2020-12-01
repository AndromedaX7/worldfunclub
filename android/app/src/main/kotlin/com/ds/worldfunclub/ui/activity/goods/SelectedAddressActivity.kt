//package com.ds.worldfunclub.ui.activity.goods
//
//import android.graphics.Color
//import com.alibaba.android.arouter.facade.annotation.Autowired
//import com.alibaba.android.arouter.facade.annotation.Route
//import com.ds.worldfunclub.R
//import com.ds.worldfunclub.app.selectAddressActivity
//import com.ds.worldfunclub.base.BaseActivity
//import com.ds.worldfunclub.base.transparentStatus
//import com.ds.worldfunclub.di.component.AppComponent
//import com.ds.worldfunclub.di.component.DaggerSelectedAddressComponent
//import com.ds.worldfunclub.di.module.SelectedAddressModule
//import com.ds.worldfunclub.viewmodel.SelectedAddressModel
//
///**
// * @Author 12031
// * @Date 2020/7/15 9:37
// */
//
//@Route(path= selectAddressActivity)
//class SelectedAddressActivity : BaseActivity<SelectedAddressModel>() {
//    override fun layoutId() = R.layout.activity_selected_address
//
//    @Autowired
//    @JvmField
//    var selected=false
//
//    override fun init(appComponent: AppComponent) {
//        transparentStatus(Color.WHITE)
//        DaggerSelectedAddressComponent.builder()
//            .appComponent(appComponent)
//            .selectedAddressModule(SelectedAddressModule(this))
//            .build()
//            .linked(this)
//    }
//}
