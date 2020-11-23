package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.viewModelScope
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/4 11:04
 */
@ActivityScope
class SplashModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    init {



    }
}