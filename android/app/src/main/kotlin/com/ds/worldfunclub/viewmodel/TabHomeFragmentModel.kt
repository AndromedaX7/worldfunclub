package com.ds.worldfunclub.viewmodel

import android.content.Intent
import android.view.View
import android.widget.TextView
import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.rxLifeScope
import androidx.recyclerview.widget.RecyclerView
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
import com.ds.worldfunclub.responsebean.*
import com.ds.worldfunclub.ui.activity.ManoeuvreActivity
import com.ds.worldfunclub.ui.adapter.BannerAdapter
import com.ds.worldfunclub.ui.adapter.MainEntryAdapter
import com.ds.worldfunclub.ui.delegate.*
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/8 9:17
 */
@FragmentScope
class TabHomeFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireContext()), LifecycleObserver {
    @get:Bindable
    val bannerAdapter = BannerAdapter()

    @get:Bindable
    val bannerBean = BannerBeanAdapter()

    @get:Bindable
    val bannerBean2 = BannerBeanAdapter()

    @get:Bindable
    val bannerAdapter2 = BannerAdapter()

    @get:Bindable
    val mainPager = MainEntryAdapter()

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

    @get:Bindable
    var seckillAdapterCount = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.seckillAdapterCount)
        }

    @get:Bindable
    val seckillAdapter: MultiTypeAdapter<DiscountGoods.DataBean> = MultiTypeAdapter()

    @get:Bindable
    val discountAdapter = MultiTypeAdapter<DiscountList.DataBean>()

    @get:Bindable
    val concentrationAdapter: MultiTypeAdapter<CategoryGoods.DataBean> = MultiTypeAdapter()


    @get:Bindable
    val recommendAdapter: MultiTypeAdapter<CategoryGoods.DataBean> = MultiTypeAdapter()

    init {
        activity.lifecycle.addObserver(this)
        discountAdapter.addDelegate(DiscountDelegate(this))
        seckillAdapter.addDelegate(MainSeckillDelegate2())
        concentrationAdapter.addDelegate(ConcentrationDelegate4())
        concentrationAdapter.addDelegate(Concentration4MoreDelegate())
        recommendAdapter.addDelegate(MainRecommendDelegate())
        //TODO 首页功能START
        val mainData = ArrayList<HomeCategory.DataBean.ChildBean>()
        val m0 = HomeCategory.DataBean.ChildBean()
        m0.name = "新人福利"
        m0.entryUrl = "/home/entry0"
        m0.type = 1
        m0.res = R.mipmap.group_0
        mainData.add(m0)
        val m1 = HomeCategory.DataBean.ChildBean()
        m1.name = "品牌专区"
        m1.entryUrl = "/home/entry1"
        m1.type = 1
        m1.res = R.mipmap.group_1
        mainData.add(m1)
        val m2 = HomeCategory.DataBean.ChildBean()
        m2.name = "热销榜单"
        m2.entryUrl = "/home/entry2"
        m2.type = 1
        m2.res = R.mipmap.group_2
        mainData.add(m2)
        val m3 = HomeCategory.DataBean.ChildBean()
        m3.name = "10元秒杀"
        m3.entryUrl = "/home/entry3"
        m3.type = 1
        m3.res = R.mipmap.group_3
        mainData.add(m3)
        val m4 = HomeCategory.DataBean.ChildBean()
        m4.name = "签到领钱"
        m4.entryUrl = "/home/entry4"
        m4.type = 1
        m4.res = R.mipmap.group_4
        mainData.add(m4)
//        val m5 = HomeCategory.DataBean.ChildBean()
//        m5.name = "首页功能"
//        m5.entryUrl = "/home/entry4"
//        m5.type = 0
//        m5.res = R.mipmap.group_4


//        mainData.add(m5)
//        mainData.add(m5)
//        mainData.add(m5)
//        mainData.add(m5)
//        mainData.add(m5)
//        mainData.add(m5)
//        mainData.add(m5)
//        mainData.add(m5)
//        mainData.add(m5)
//        mainData.add(m5)

        mainPager.setFlowData(mainData)
        //TODO 首页功能END

        homeBanner()
        homeBannerChoice()
        homeActives()
    }

    private fun homeActives() {
        rxLifeScope.launch {
            val homeActive = api.homeActive(1)
            if (homeActive.code == 1) {
                val mainData = ArrayList<HomeCategory.DataBean.ChildBean>()
                homeActive.data.forEach {
                    val bean =HomeCategory.DataBean.ChildBean()
                    bean.isInternal=false
                    bean.activity_id=it.activity_id
                    bean.activity_sign=it.activity_sign
                    bean.name =it.activity_name
                    bean.type=1
                    bean.image=it.image
                    bean.entryUrl="/other"
                    mainData.add(bean)
                }
               mainPager.setFlowData(mainData)
            }
        }
    }

    fun homeRefresh(r: SwipeRefreshLayout) {
        willSearch()
        recommendAdapter.clear()
        concentrationAdapter.clear()
        discountAdapter.clear()
        seckillAdapter.clear()
        homeGoodsChoice()
        homeGoodsDefault()
        homeDiscount()
        viewPage = 0
        homeBanner()
        homeBannerChoice()
        homeActives()
        bannerBean.selectedPos(-1)
        bannerBean2.selectedPos(-1)
        activity.view?.postDelayed({
            r.isRefreshing = false
        }, 1000)

    }

    private fun homeDiscount() {
        rxLifeScope.launch {
            val discountList = api.getDiscountList()
            if (discountList.code == 1) {
                activity.view?.findViewById<View>(R.id.timeSK)?.visibility = View.VISIBLE
                discountAdapter.addData2(ArrayList(discountList.data))
                (discountAdapter.getPosition(0) as DiscountDelegate)
                    .onSelected(
                        if (discountAdapter.realSize() == 1) {
                            0
                        } else {
                            1
                        },
                        if (discountAdapter.realSize() == 1) {
                            discountAdapter.data[0]
                        } else {
                            discountAdapter.data[1]
                        }
                    )
            } else {
                activity.view?.findViewById<View>(R.id.timeSK)?.visibility = View.GONE
            }
        }
    }

    fun notifyInitData() {
        willSearch()
        recommendAdapter.clear()
        concentrationAdapter.clear()
        discountAdapter.clear()
        seckillAdapter.clear()
        homeGoodsChoice()
        homeGoodsDefault()
        homeDiscount()
    }

    private fun homeBanner() {
        rxLifeScope.launch {
            val bannerData = api.banner("99999", "1")
            if (bannerData.code == 1) {
                bannerAdapter.setData(ArrayList(bannerData.data))
                bannerBean.createdByCount(bannerData.data.size)
                bannerCount = bannerData.data.size
            } else {
                bannerAdapter.setData(arrayListOf(BannerData.DataBean()))
                bannerCount = 0
            }
        }
    }

    private fun homeBannerChoice() {
        rxLifeScope.launch {
            val bannerData = api.banner("99999", "2")
            if (bannerData.code == 1) {
                bannerAdapter2.setData(ArrayList(bannerData.data))
                bannerBean2.createdByCount(bannerData.data.size)
                banner2Count = bannerData.data.size
            } else {
                bannerAdapter2.setData(arrayListOf(BannerData.DataBean()))
                banner2Count = 0
            }
        }
    }

    private fun homeGoodsDefault() {
        rxLifeScope.launch {
            val goods = api.categoryGoods("99999", true, "2", 1)
            when (goods.code) {
                1 -> {
                    if (goods.data != null) {
                        concentrationAdapterCount = goods.data.size
                        concentrationAdapter.addData2(ArrayList(goods.data))
                        if (goods.data.size <= 5) {
                            concentrationAdapter.removeDelegate(Concentration4MoreDelegate::class.java)
                        }
                        activity.view?.findViewById<RecyclerView>(R.id.vconcentrationGridLayoutManager)
                            ?.smoothScrollToPosition(0)
                    }
                }
                else -> {
                    concentrationAdapter.removeDelegate(Concentration4MoreDelegate::class.java)
                    concentrationAdapterCount = 0
                }
            }
        }
    }

    private fun homeGoodsChoice() {
        rxLifeScope.launch {
            val goods = api.categoryGoods("99999", true, "1", page)
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


    private fun homeDiscountGoods(id: String) {
        seckillAdapter.clear()
        rxLifeScope.launch {
            val goods = api.getDiscountGoods(id)
            if (goods.code == 1) {
                seckillAdapter.addData2(ArrayList(goods.data))
                seckillAdapterCount = goods.data.size
            } else {
                seckillAdapter.addData2(ArrayList())
                seckillAdapterCount = 0
            }
        }
    }


    @OnLifecycleEvent(Lifecycle.Event.ON_START)
    fun onStart() {
        val bigHeight = DataBindingAdapter.dp2px(activity.requireContext(), 92)
        val smlHeight = DataBindingAdapter.dp2px(activity.requireContext(), 68)
        val view = activity.view?.findViewById<View>(R.id.vpz)
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
                    lp.height = bigHeight + smlHeight
                    view.layoutParams = lp
                }
                else -> {
                    val lp = view.layoutParams
                    lp.height = bigHeight + smlHeight + smlHeight
                    view.layoutParams = lp
                }
            }
        }


    }

    fun openManoeuvre() {
        activity.startActivity(Intent(activity.context, ManoeuvreActivity::class.java))
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
        time?.time_difference?.let {
//            val end: Long = time !!.end_time!!.toLong() *1000

            var time = /*end - System.currentTimeMillis()*/ time!!.time_difference.toLong() * 1000
            time /= 1000
            val second = time % 60
            val vSecond = activity.view?.findViewById<TextView>(R.id.second)
            when {
                second >= 10 -> vSecond?.text = "$second"
                second < 0 -> vSecond?.text = "59"
                else -> {
                    vSecond?.text = "0$second"
                }
            }
            time /= 60
            val minute = time % 60
            val vMinute = activity.view?.findViewById<TextView>(R.id.minute)
            when {
                minute >= 10 -> vMinute?.text = "$minute"
                second < 0 -> vMinute?.text = "59"
                else -> {
                    vMinute?.text = "0$minute"
                }
            }
            time /= 60
            val vHour = activity.view?.findViewById<TextView>(R.id.hour)
            val hour = time % 60
            when {
                hour >= 10 -> vHour?.text = "$hour"
                second < 0 -> vHour?.text = "99"
                else -> {
                    vHour?.text = "0$hour"
                }
            }

        }
        time?.let {
            time?.time_difference = (time!!.time_difference.toInt() - 1).toString()
        }


    }

    override fun loadMore() {
        super.loadMore()
        homeGoodsChoice()
    }

    fun selectedTime(data: DiscountList.DataBean) {
        discountAdapter.notifyDataSetChanged()
        time = data
        homeDiscountGoods(data.discount_id)
    }


    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onDestroy() {
        activity.lifecycle.removeObserver(this)
    }

    private var viewPage = 0
    private var time: DiscountList.DataBean? = null
}

