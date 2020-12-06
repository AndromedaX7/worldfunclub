package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/15 13:34
 */
@ActivityScope
class AddBankCardModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity)