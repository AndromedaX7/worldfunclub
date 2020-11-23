package com.ds.worldfunclub.viewmodel

import android.view.View
import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.rxLifeScope
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import androidx.viewpager.widget.ViewPager
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.DataBindingAdapter
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.BannerData
import com.ds.worldfunclub.responsebean.CategoryGoods
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.ui.adapter.BannerAdapter
import com.ds.worldfunclub.ui.adapter.MainEntryAdapter
import com.ds.worldfunclub.ui.delegate.BannerBeanAdapter
import com.ds.worldfunclub.ui.delegate.Concentration4MoreDelegate
import com.ds.worldfunclub.ui.delegate.ConcentrationDelegate4
import com.ds.worldfunclub.ui.delegate.MainRecommendDelegate
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/8 9:17
 */
@FragmentScope
class TabOtherFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireContext()), LifecycleObserver {

    private var categoryId: String = ""

    @get:Bindable
    val bannerBean = BannerBeanAdapter()

    @get:Bindable
    val bannerBean2 = BannerBeanAdapter()

    @get:Bindable
    val bannerAdapter = BannerAdapter()

    @get:Bindable
    val bannerAdapter2 = BannerAdapter()

    @get:Bindable
    val mainPager = MainEntryAdapter()

    @get:Bindable
    val concentrationAdapter: MultiTypeAdapter<CategoryGoods.DataBean> = MultiTypeAdapter()

    @get:Bindable
    val recommendAdapter: MultiTypeAdapter<CategoryGoods.DataBean> = MultiTypeAdapter()

    @get:Bindable
    var childCategory = ArrayList<HomeCategory.DataBean.ChildBean>()
        set(value) {
            field = value
            notifyPropertyChanged(BR.childCategory)
        }

    @get:Bindable
    var bannerCount = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.bannerCount)
        }
    @get:Bindable
    var concentrationAdapterCount = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.concentrationAdapterCount)
        }

    @get:Bindable
    var banner2Count = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.banner2Count)
        }

    init {
        concentrationAdapter.addDelegate(ConcentrationDelegate4())
        concentrationAdapter.addDelegate(Concentration4MoreDelegate())
        recommendAdapter.addDelegate(MainRecommendDelegate())
        activity.lifecycle.addObserver(this)
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onDestroy() {
        activity.lifecycle.removeObserver(this)
    }


    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    fun onStart() {
        val view = activity.view?.findViewById<View>(R.id.vpz)
        val bigHeight = DataBindingAdapter.dp2px(activity.requireContext(), 90)
//        val height = DataBindingAdapter.dp2px(activity.requireContext(), 225 / 3)
        view?.let {
            when (mainPager.dataCount()) {
                0 -> {
                    val lp = view.layoutParams
                    lp.height = 0
                    view.layoutParams = lp
                }
                in 1..5 -> {
                    val lp = view.layoutParams
                    lp.height = bigHeight
                    view.layoutParams = lp
                }
                in 6..10 -> {
                    val lp = view.layoutParams
                    lp.height = bigHeight * 2
                    view.layoutParams = lp
                }
                else -> {
                    val lp = view.layoutParams
                    lp.height = bigHeight * 3
                    view.layoutParams = lp
                }
            }
        }
    }


    fun notifyInitData() {
        willSearch()
        recommendAdapter.clear()
        categoryGoods()
        concentrationAdapter.clear()
        categoryGoodsDefault()
    }

    private fun categoryGoodsDefault() {
        rxLifeScope.launch {
            val goods = api.categoryGoods(
                categoryId,
                true,
                "2",
                1
            )
            when (goods.code) {
                1 -> {
                    if (goods.data != null) {
                        concentrationAdapter.addData2(ArrayList(goods.data))
                        if (goods.data.size <= 5) {
                            concentrationAdapter.removeDelegate(Concentration4MoreDelegate::class.java)
                        }
                        concentrationAdapterCount=goods.data.size
                    }
                }
                else -> {
                    concentrationAdapter.removeDelegate(Concentration4MoreDelegate::class.java)
                    concentrationAdapterCount=0
                }
            }
        }
    }

    private fun categoryGoods() {
        rxLifeScope.launch {
            val goods = api.categoryGoods(
                categoryId,
                true,
                "1",
                page
            )
            when (goods.code) {
                1 -> {
                    if (goods.data != null) {
                        recommendAdapter.addData2(ArrayList(goods.data))
                    }

                    canLoad = true
                }
                else -> {
                    canLoad = false

                }
            }

            if (recommendAdapter.data.size > 0) {
                activity.view?.findViewById<View>(R.id.hotSaleBar)?.visibility = View.VISIBLE
                activity.view?.findViewById<View>(R.id.vbar)?.visibility = View.VISIBLE
            } else {
                activity.view?.findViewById<View>(R.id.hotSaleBar)?.visibility = View.GONE
                activity.view?.findViewById<View>(R.id.vbar)?.visibility = View.GONE
            }
        }
    }

    private var viewPage = 0

    fun init(categoryId: String,categoryData:ArrayList<HomeCategory.DataBean.ChildBean>) {
        this.categoryId = categoryId
        childCategory = if (categoryData != null)
            ArrayList(categoryData)
        else
            ArrayList()
        mainPager.setFlowData(childCategory)
        categoryBanner(categoryId)
        categoryBannerChoice(categoryId)
    }

    private fun categoryBanner(categoryId: String) {
        rxLifeScope.launch {
            val banner = api.banner(categoryId, "1")
            if (banner.code == 1) {
                bannerAdapter.setData(ArrayList(banner.data))
                bannerBean.createdByCount(banner.data.size)
                bannerCount = banner.data.size
            } else {
                bannerAdapter.setData(arrayListOf(BannerData.DataBean()))
                bannerCount = 0
            }
        }
    }

    private fun categoryBannerChoice(categoryId: String) {
        rxLifeScope.launch {
            val bannerData = api.banner(categoryId, "2")
            if (bannerData.code == 1) {
                bannerAdapter2.setData(ArrayList(bannerData.data))
                bannerBean2.createdByCount(bannerData.data.size)
                banner2Count = bannerData.data.size
            } else if (bannerData.code == -2) {
                bannerAdapter2.setData(arrayListOf(BannerData.DataBean()))
                banner2Count = 0
            }
        }
    }

    private var count = 0
    fun broadcast() {
        val banner: ViewPager? = activity.view?.findViewById(R.id.banner)
        val banner2: ViewPager? = activity.view?.findViewById(R.id.banner2)
        count++
        if (count % 5 == 0) {
            viewPage++
            if (bannerAdapter.count > 0) {
                banner?.currentItem = viewPage % bannerAdapter.count
                bannerBean.selectedPos(viewPage % bannerAdapter.count)
            }
            if (bannerAdapter2.count > 0) {
                banner2?.currentItem = (viewPage % bannerAdapter2.count)
                bannerBean2.selectedPos(viewPage % bannerAdapter2.count)
            }
        }
    }

    fun categoryRefresh(r: SwipeRefreshLayout) {
        willSearch()
        recommendAdapter.clear()
        concentrationAdapter.clear()
        categoryGoods()
        categoryGoodsDefault()
        viewPage = 0
        categoryBanner(categoryId)
        categoryBannerChoice(categoryId)
        bannerBean.selectedPos(-1)
        bannerBean2.selectedPos(-1)
        activity.view?.postDelayed({
            r.isRefreshing = false
        }, 1000)
    }

    override fun loadMore() {
        super.loadMore()
        categoryGoods()
    }
}

