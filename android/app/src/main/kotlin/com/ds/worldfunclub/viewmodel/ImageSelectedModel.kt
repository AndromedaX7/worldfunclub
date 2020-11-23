package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/16 15:39
 */
@ActivityScope
class ImageSelectedModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
}

