package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.delegate.ClubDelegate
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/6 15:15
 */
@FragmentScope
class ClubFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireContext()){
    val adapter=MultiTypeAdapter<MainSeckill>()

    init {
        adapter.addDelegate(ClubDelegate())
        adapter.addData2(arrayListOf(MainSeckill(),MainSeckill(),MainSeckill()))
    }

}