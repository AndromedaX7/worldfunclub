package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.recyclerview.widget.GridLayoutManager
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.ManoeuvreDelegate
import kotlinx.android.synthetic.main.activity_manoeuvre.*
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/13 14:20
 */
@ActivityScope
class ManoeuvreModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity),LifecycleObserver{

    @get:Bindable
    val  manoeuvreAdapter=MultiTypeAdapter<MainSeckill>()
    @get:Bindable
    val gManager=GridLayoutManager(activity,2,GridLayoutManager.VERTICAL,false)

    init {
        activity.lifecycle.addObserver(this)
        manoeuvreAdapter.addDelegate(ManoeuvreDelegate())
        manoeuvreAdapter.addData2(arrayListOf(MainSeckill(),MainSeckill()))
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_CREATE)
    fun onCreated(){
        val tabs = activity.manoeuvreTab
        val tab =tabs.newTab()
        tab.text="女装"
        tabs.addTab(tab)

    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onDestroyed(){
        activity.lifecycle.removeObserver(this)
    }
}

