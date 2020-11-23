package com.ds.worldfunclub.viewmodel

import android.view.View
import androidx.core.app.ActivityOptionsCompat
import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.*
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.pair
import com.ds.worldfunclub.ui.adapter.HomeTabAdapter
import com.ds.worldfunclub.ui.fragment.livetab.LiveTabFragment
import kotlinx.android.synthetic.main.fragment_live.*
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/6 15:15
 */
@FragmentScope
class LiveFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireContext()), LifecycleObserver {

    @get:Bindable
    val homeAdapter = HomeTabAdapter(activity.fragmentManager!!)

    init {
        activity.lifecycle.addObserver(this)
    }





    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onDestroy() {
        activity.lifecycle.removeObserver(this)
    }


    fun openSearch(v: View) {
        ARouter.getInstance().build(searchGlobal).withOptionsCompat(
            ActivityOptionsCompat.makeSceneTransitionAnimation(
                activity.requireActivity(),
                activity.pair(
                    v,
                    R.string.tran_search_bound
                ),
                activity.pair(activity.edit, R.string.tran_search_edit),
                activity.pair(activity.img, R.string.tran_search_img)
            )
        ).navigation(activity.requireActivity())
    }

    fun delicacy() {
        ARouter.getInstance().build(delicacyHome).navigation()
    }

    fun hotel() {
        ARouter.getInstance().build(hotelHome).navigation()
    }

    fun getCoupon() {
        ARouter.getInstance().build(getCoupon).navigation()
    }

    fun casual() {
        ARouter.getInstance().build(casualHome).navigation()
    }
}



