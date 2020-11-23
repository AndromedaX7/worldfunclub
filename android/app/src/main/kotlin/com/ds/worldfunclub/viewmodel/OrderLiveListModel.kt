package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.databinding.Bindable
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.rxLifeScope
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import androidx.viewpager.widget.ViewPager
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.OrderState
import com.ds.worldfunclub.ui.activity.order.OrderListActivity
import com.ds.worldfunclub.ui.activity.order.OrderLiveListActivity
import com.ds.worldfunclub.ui.adapter.HomeTabAdapter
import com.ds.worldfunclub.ui.adapter.OrderLiveAdapter
import com.ds.worldfunclub.ui.fragment.OrderListFragment
import com.google.android.material.tabs.TabLayout
import kotlinx.android.synthetic.main.activity_live_order_list.*
import kotlinx.android.synthetic.main.activity_live_order_list.pager
import kotlinx.android.synthetic.main.activity_live_order_list.tabLayout
import kotlinx.android.synthetic.main.activity_order_list.*
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/24 16:12
 */
@ActivityScope
class OrderLiveListModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity), LifecycleObserver {
    @get:Bindable
    val adapter = HomeTabAdapter(activity.supportFragmentManager)
    override fun onReady() {
        super.onReady()
        adapter.titles.addAll(arrayListOf( "待付款", "待使用", "已使用","已过期"))

        for (i in 0 until adapter.titles.size){
            val fragment= OrderListFragment()
            fragment.pos=i
            fragment.source=2
            adapter.appendFragment(fragment)
        }

        activity.tabLayout.setupWithViewPager(activity.pager)

    }
}

