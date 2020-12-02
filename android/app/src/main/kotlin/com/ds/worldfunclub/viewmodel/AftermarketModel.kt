package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.AftermarketState0Delegate
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/22 上午10:17
 */
@ActivityScope
class AftermarketModel @Inject constructor(
        val activity: AppCompatActivity,
        val app: App, val api: Api
) : BaseModel(activity) {
    @get:Bindable
    val adapter = MultiTypeAdapter<MainSeckill>()

    init {
        adapter.addDelegate(AftermarketState0Delegate())
//        adapter.addData2(arrayListOf(MainSeckill()))
    }


}

