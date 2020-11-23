package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.ManoeuvreDelegate
import com.ds.worldfunclub.ui.delegate.SpecialOfferSingleDelegate
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/14 14:26
 */
@ActivityScope
class SpecialOfferModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    @get:Bindable
    val adapter = MultiTypeAdapter<MainSeckill>()
    @get:Bindable
    val adapter2=MultiTypeAdapter<MainSeckill>()


    init {
        adapter.addDelegate(SpecialOfferSingleDelegate())
        adapter.addData(arrayListOf(MainSeckill(), MainSeckill()))
        adapter2.addDelegate(ManoeuvreDelegate())
        adapter2.addData(arrayListOf(MainSeckill(), MainSeckill()))
    }
}

