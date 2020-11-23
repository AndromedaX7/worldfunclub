package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午10:40
 */
@ActivityScope
class ModifyPhoneConfirmModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
}

