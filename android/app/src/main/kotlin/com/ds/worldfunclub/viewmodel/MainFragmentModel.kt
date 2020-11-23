package com.ds.worldfunclub.viewmodel

import android.content.Intent
import android.util.Log
import android.view.View
import androidx.core.app.ActivityOptionsCompat
import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.rxLifeScope
import androidx.viewpager.widget.ViewPager
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.messageCenter
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.pair
import com.ds.worldfunclub.ui.activity.SearchActivity
import com.ds.worldfunclub.ui.activity.goods.GoodsCategoryActivity
import com.ds.worldfunclub.ui.adapter.HomeTabAdapter
import com.ds.worldfunclub.ui.fragment.hometab.TabHomeFragment
import com.ds.worldfunclub.ui.fragment.hometab.TabOtherFragment
import com.ds.worldfunclub.widget.RevealAnimation.EXTRA_CIRCULAR_REVEAL_X
import com.ds.worldfunclub.widget.RevealAnimation.EXTRA_CIRCULAR_REVEAL_Y
import com.google.android.material.tabs.TabLayout
import kotlinx.android.synthetic.main.fragment_main.*
import kotlinx.coroutines.*
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/6 15:15
 */
@FragmentScope
class MainFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireContext()), LifecycleObserver {
    @get:Bindable
    val homeAdapter = HomeTabAdapter(activity.fragmentManager!!)


    init {
        activity.lifecycle.addObserver(this)
    }

    override fun onReady() {
        super.onReady()

        val tabs = activity.tabs
        rxLifeScope.launch {
            val homeCategory = api.homeCategory()
            if (homeCategory == null) {

            } else {
//        tabs.setupWithViewPager(activity.mainTabContainer)
                val iter= homeCategory.data.iterator()
                while (iter.hasNext()){
                   val next= iter.next()
                    if(next.category_type== "2"){
                        iter.remove()
                    }
                }

                val tab = tabs.newTab()
                tab.tag = 0
                tab.text = "特惠活动专区"
                tabs.addTab(tab)
                if (homeCategory.code == 1) {
                    homeAdapter.appendFragment(TabHomeFragment())
                    val count = homeCategory.data.size
                    for (i in 0 until count) {
                        homeAdapter.appendFragment(TabOtherFragment().setCategory(homeCategory.data[i]))
                        val templates = tabs.newTab()
                        templates.tag = i + 1
                        templates.text = homeCategory.data[i].name
                        tabs.addTab(templates)
                    }
                    homeAdapter.updateFragment(0)
                }
            }
        }

        activity.mainTabContainer.addOnPageChangeListener(object : ViewPager.OnPageChangeListener {
            override fun onPageScrollStateChanged(state: Int) {
            }

            override fun onPageScrolled(
                position: Int,
                positionOffset: Float,
                positionOffsetPixels: Int
            ) {
                tabs.setScrollPosition(position, positionOffset, true, true)
            }

            override fun onPageSelected(position: Int) {
                Log.e("pageSelected", "page:$position")
                homeAdapter.updateFragment(position)
            }

        })

        tabs.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabReselected(tab: TabLayout.Tab?) {
                tab?.let {
                    it.tag?.let { pos ->
                        activity.mainTabContainer.currentItem = pos as Int
                    }
                }
            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {
            }

            override fun onTabSelected(tab: TabLayout.Tab?) {
                tab?.let {
                    it.tag?.let { pos ->
                        activity.mainTabContainer.currentItem = pos as Int
                    }
                }
            }
        })
    }

    fun openSearch() {
        activity.startActivity(
            Intent(activity.context, SearchActivity::class.java),
            ActivityOptionsCompat.makeSceneTransitionAnimation(
                activity.requireActivity(),
                activity.pair(
                    activity.bound,
                    R.string.tran_search_bound
                ),
                activity.pair(activity.edit, R.string.tran_search_edit),
                activity.pair(activity.img, R.string.tran_search_img)
            ).toBundle()
        )
    }

    fun goodsCategory(target: View) {

        val x: Int = (target.x + target.width / 2).toInt()
        val y: Int = (target.y + target.height / 2).toInt()
        activity.startActivity(
            Intent(activity.context, GoodsCategoryActivity::class.java).putExtra(
                EXTRA_CIRCULAR_REVEAL_X,
                x
            )
                .putExtra(EXTRA_CIRCULAR_REVEAL_Y, y),
            ActivityOptionsCompat.makeSceneTransitionAnimation(
                activity.requireActivity(),
                target, "transition"
            ).toBundle()
        )
    }

    fun openMessage() {
        ARouter.getInstance().build(messageCenter).navigation()
    }


    @OnLifecycleEvent(Lifecycle.Event.ON_CREATE)
    fun onCreated() {
        loopJob = GlobalScope.launch {
            while (true) {
                delay(1000)
                withContext(Dispatchers.Main) {
                    val pager = activity.view?.findViewById<ViewPager>(R.id.mainTabContainer)
                    pager?.let {
                        homeAdapter.broadcast(it.currentItem)
                    }

                }

            }

        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onDestroy() {
        loopJob?.cancel()
        activity.lifecycle.removeObserver(this)
    }

    var loopJob: Job? = null
}