package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.Footpoint
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.FootprintDelegate
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/7/29 上午9:21
 */
@ActivityScope
class MyFootprintModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    val adapter = MultiTypeAdapter<Footpoint>()

    init {
        adapter.addDelegate(FootprintDelegate())
        adapter.addData2(
            arrayListOf(
                Footpoint(false, "今天", MainSeckill()),
                Footpoint(true, "今天", MainSeckill()),
                Footpoint(true, "今天", MainSeckill()),
                Footpoint(false, "昨天", MainSeckill()),
                Footpoint(true, "昨天", MainSeckill()),
                Footpoint(true, "昨天", MainSeckill())
            )
        )

    }
}
