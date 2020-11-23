package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.LifecycleObserver
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.OrderListActivity
import com.ds.worldfunclub.ui.adapter.HomeTabAdapter
import com.ds.worldfunclub.ui.fragment.OrderListFragment
import kotlinx.android.synthetic.main.activity_order_list.*
import javax.inject.Inject

/**
 * @Author mi
 * @Date 2020/7/20 4:20 PM
 */
@ActivityScope
class OrderListModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity), LifecycleObserver {
    @get:Bindable
    val adapter = HomeTabAdapter(activity.supportFragmentManager)


    override fun onReady() {
        super.onReady()
        adapter.titles.addAll(arrayListOf("全部订单", "待付款", "待发货", "待收货", "待评价"))

        for (i in 0 until adapter.titles.size) {
            val fragment = OrderListFragment()
            fragment.pos = i
            fragment.source = 1
            adapter.appendFragment(fragment)
        }

        activity.tabLayout.setupWithViewPager(activity.pager)
        val aty = activity as OrderListActivity
        aty.tabLayout.postDelayed({
            aty.tabLayout.setScrollPosition(aty.state, 0f, true, true)
            activity.pager.currentItem = aty.state
        }, 300)

    }

}

