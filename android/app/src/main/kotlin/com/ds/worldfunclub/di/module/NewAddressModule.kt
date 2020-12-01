//package com.ds.worldfunclub.di.module
//
//import androidx.lifecycle.ViewModelProvider
//import com.ds.worldfunclub.app.App
//import com.ds.worldfunclub.base.ViewModelFactory2
//import com.ds.worldfunclub.di.ActivityScope
//import com.ds.worldfunclub.network.Api
//import com.ds.worldfunclub.ui.activity.goods.NewAddressActivity
//import com.ds.worldfunclub.viewmodel.NewAddressModel
//import dagger.Module
//import dagger.Provides
//
///**
// * @Author tachibanako
// * @Date 2020/7/15 下午2:56
// */
//
//@Module
//class NewAddressModule(private val activity: NewAddressActivity) {
//
//    @ActivityScope
//    @Provides
//    fun provideNewAddressModel(app: App, api: Api): NewAddressModel {
//        return ViewModelProvider(
//            activity,
//            ViewModelFactory2(activity, app, api)
//        ).get(NewAddressModel::class.java)
//
//    }
//}
