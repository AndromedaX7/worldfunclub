package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.MyVipDelegate
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/7/25 上午9:30
 */
@ActivityScope
class MyVipModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    val adapter =MultiTypeAdapter<MainSeckill> ()
    init {
        adapter.addDelegate(MyVipDelegate())
        adapter.addData2(arrayListOf(MainSeckill(),MainSeckill()))

    }
}
