package com.ds.worldfunclub.viewmodel

import android.content.DialogInterface
import android.graphics.Color
import android.util.Log
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.DataBindingAdapter
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.AftermarketState0Delegate
import com.ds.worldfunclub.ui.dialog.AlertDialog
import com.yanzhenjie.recyclerview.SwipeMenuItem
import com.yanzhenjie.recyclerview.SwipeRecyclerView
import kotlinx.android.synthetic.main.activity_aftermarket.*
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/22 上午10:17
 */
@ActivityScope
class AftermarketModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity)  {
    @get:Bindable
    val adapter = MultiTypeAdapter<MainSeckill>()

    init {
        adapter.addDelegate(AftermarketState0Delegate())
//        adapter.addData2(arrayListOf(MainSeckill()))
    }




}

