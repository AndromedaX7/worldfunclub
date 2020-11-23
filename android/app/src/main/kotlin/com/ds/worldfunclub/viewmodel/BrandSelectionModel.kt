package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.GoodsItemContentDelegate
import com.ds.worldfunclub.ui.delegate.GoodsItemContentDelegate2
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/14 14:07
 */
@ActivityScope
class BrandSelectionModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    val adapter = MultiTypeAdapter<MainSeckill>()

    init {
        adapter.addDelegate(GoodsItemContentDelegate2())
        adapter.addData2(arrayListOf(MainSeckill(), MainSeckill(), MainSeckill ()))
    }
}

