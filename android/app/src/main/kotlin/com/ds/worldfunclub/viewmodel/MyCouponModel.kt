package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.CouponDelegate0
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/7/23 上午9:46
 */
@ActivityScope
class MyCouponModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    @get:Bindable
    val adapter=MultiTypeAdapter<MainSeckill>()
    init {
        adapter.addDelegate(CouponDelegate0())
        adapter.addData2(arrayListOf(MainSeckill(),
            MainSeckill(), MainSeckill
        ()
        ))
    }
}
