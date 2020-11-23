package com.ds.worldfunclub.viewmodel

import android.view.View
import androidx.appcompat.app.AppCompatActivity
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.modifyPhoneNumber
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:54
 */
@ActivityScope
class AccountAndSecurityModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    fun modifyPhone(view: View) {
        ARouter.getInstance().build(modifyPhoneNumber).navigation()
    }

    fun modifyPayPassword(view: View){
        ARouter.getInstance().build(com.ds.worldfunclub.app.modifyPayPassword).navigation()
    }

    fun permission(){
        ARouter.getInstance().build(com.ds.worldfunclub.app.systemPermission).navigation()
    }
}

