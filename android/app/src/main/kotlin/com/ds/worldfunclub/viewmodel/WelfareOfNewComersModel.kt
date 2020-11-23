package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.BookStyleDelegate
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/14 13:34
 */
@ActivityScope
class WelfareOfNewComersModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    @get:Bindable
    val bookAdapter = MultiTypeAdapter<MainSeckill>()

    init {
        bookAdapter.addDelegate(BookStyleDelegate())
        bookAdapter.addData2(arrayListOf(MainSeckill(), MainSeckill(), MainSeckill()))
    }
}

