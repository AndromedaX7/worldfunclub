package com.ds.worldfunclub.viewmodel

import android.os.Handler
import android.text.TextUtils
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.core.widget.NestedScrollView
import androidx.databinding.Bindable
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.cartActivity
import com.ds.worldfunclub.app.goodsPingjiaActivity
import com.ds.worldfunclub.app.shopDetailsActivity
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.databinding.ViewGoodsCouponBinding
import com.ds.worldfunclub.databinding.ViewPropPropsBinding
import com.ds.worldfunclub.databinding.ViewPropRootBinding
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.responsebean.*
//import com.ds.worldfunclub.sharedAndShow
import com.ds.worldfunclub.ui.CallOrderCreate
import com.ds.worldfunclub.ui.activity.goods.GoodsDetailsActivity
import com.ds.worldfunclub.ui.adapter.FlowAdapter
import com.ds.worldfunclub.ui.adapter.GoodsBanner
import com.ds.worldfunclub.ui.adapter.GoodsBannerAdapter
import com.ds.worldfunclub.ui.delegate.*
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.google.android.material.tabs.TabLayout
import kotlinx.android.synthetic.main.activity_goods_details.*
import kotlinx.coroutines.*
import java.util.*
import javax.inject.Inject
import kotlin.collections.ArrayList

/**
 * @Author 12031
 * @Date 2020/7/9 15:21
 */
@ActivityScope
class GoodsDetailsModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity), LifecycleObserver, ThumbsHandler, CallOrderCreate {
    private val propArray = ArrayList<GoodsDetailsResp2.DataBean.SpecAttrBean.SpecItemsBean>()
    private val bottomSheet = BottomSheetDialog(activity)
    private val bottomSheetCoupon = BottomSheetDialog(activity)
    private val goodsPropAdapters =
        ArrayList<FlowAdapter<GoodsDetailsResp2.DataBean.SpecAttrBean.SpecItemsBean>>()
    private val propSKUArray = ArrayList<GoodsDetailsResp2.DataBean.SkuListBean>()
    private var details: GoodsDetailsResp2.DataBean? = null
    private var discountId = ""
    var skuIds = ""
    var skuSelected: SkuData.DataBean? = null

    @get:Bindable
    val bannerAdapter = GoodsBannerAdapter()

    @get:Bindable
    val youLikeAdapter = MultiTypeAdapter<MainSeckill>()

    @get:Bindable
    val goodsCouponAdapter = MultiTypeAdapter<GoodsCouponData.DataBean>()

    @get:Bindable
    val goodsPingjia = MultiTypeAdapter<GoodsDetailsResp2.DataBean.CommentDataBean>()

    @get:Bindable
    var goodsName = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsName)
        }

    @get:Bindable
    var goodsPrice = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsPrice)
        }

    @get:Bindable
    var marketGoodsPrice = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.marketGoodsPrice)
        }

    @get:Bindable
    var hasSale = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.hasSale)
        }

    @get:Bindable
    var goodsPingjiaCount = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsPingjiaCount)
        }

    @get:Bindable
    var goodsCouponText = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsCouponText)
        }

    @get:Bindable
    var services = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.services)
        }

    @get:Bindable
    var goodsContent = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsContent)
        }

    @get:Bindable
    var goodsCartCount = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsCartCount)
        }

    @get:Bindable
    var hasSelectedPropName = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.hasSelectedPropName)
        }


    @get:Bindable
    var skuGoodsImage = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.skuGoodsImage)
        }

    @get:Bindable
    var skuGoodsPrice = "0.00"
        set(value) {
            field = value
            goodsPrice = value
            notifyPropertyChanged(BR.skuGoodsPrice)
        }

    @get:Bindable
    var skuGoodsMarketPrice = "0.00"
        set(value) {
            field = value
            marketGoodsPrice = value
            notifyPropertyChanged(BR.skuGoodsMarketPrice)
        }

    @get:Bindable
    var skuGoodsCount = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.skuGoodsCount)
        }

    /**
     * 用户下单时 商品数量
     */
    @get:Bindable
    var goodsCount = 1
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsCount)
        }


    @get:Bindable
    var goodsCollection = false
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsCollection)
        }

    @get:Bindable
    var discount: GoodsDetailsResp.DiscountBean? = null
        set(value) {
            field = value
            notifyPropertyChanged(BR.discount)
        }

    @get:Bindable
    var discountTimeText = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.discountTimeText)
        }
    var goodsAllCount = ""

    /**
     * 0:显示全部
     * 1：显示加入购物车
     * 2：显示立即购买
     */
    @get:Bindable
    var propState = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.propState)
        }

    @get:Bindable
    var canBuy = true
        set(value) {
            field = value
            notifyPropertyChanged(BR.canBuy)
        }

    private val propWrapper = DataBindingUtil.inflate<ViewPropRootBinding>(
        LayoutInflater.from(activity),
        R.layout.view_prop_root,
        null,
        false
    )

    private val couponWrapper = DataBindingUtil.inflate<ViewGoodsCouponBinding>(
        LayoutInflater.from(activity),
        R.layout.view_goods_coupon,
        null,
        false
    )

    init {
        goodsCouponAdapter.addDelegate(GoodsCouponDelegate(this))
        activity.lifecycle.addObserver(this)
        propWrapper.vm = this
        couponWrapper.vm = this
        couponWrapper.adapter = goodsCouponAdapter
        bottomSheet.setContentView(propWrapper.root)
        bottomSheet.setOnDismissListener {
            propState = 0
        }
        bottomSheet.window?.findViewById<View>(R.id.design_bottom_sheet)
            ?.setBackgroundResource(android.R.color.transparent)

        bottomSheetCoupon.setContentView(couponWrapper.root)
//        bottomSheet.window?.findViewById<View>(R.id.design_bottom_sheet)
//            ?.setBackgroundResource(android.R.color.transparent)


        goodsPingjia.addDelegate(GoodsPingjiaDelegate0(this,false))
        goodsPingjia.addDelegate(GoodsPingjiaDelegate1(this,false))
        goodsPingjia.addDelegate(GoodsPingjiaDelegate2(this,false))

//        youLikeAdapter.addDelegate(YouLikeDelegate())
//        youLikeAdapter.addData2(
//            arrayListOf(
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill()
//            )
//        )
    }

    override fun addCommentThumbs(pos: Int, evaluateId: String, isThumbs: String) {
        rxLifeScope.launch {
            val data = api.addCommentThumbs(app, evaluateId, isThumbs)
            if (data.code == 1) {
                goodsPingjia.notifyItemChanged(pos)
            }
        }

    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onDestroy() {
        loopJob?.cancel()
        activity.lifecycle.removeObserver(this)
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_CREATE)
    fun initUiEvent() {
        activity.banner.post {
            activity.viewToolbar.post {
                activity.viewToolbar.isFocusable = false
                activity.scroller.setOnScrollChangeListener(NestedScrollView.OnScrollChangeListener { _, _, scrollY, _, _ ->
                    when {
                        scrollY <= activity.banner.height -> {
                            activity.viewToolbar.alpha =
                                scrollY * 1.0f / (activity.banner.height - activity.viewToolbar.height)
                            activity.viewToolbar.visibility = View.VISIBLE
                            activity.viewToolbar.isFocusable = true

                        }
                        scrollY < 20 -> {
                            activity.viewToolbar.visibility = View.GONE
                            activity.viewToolbar.isFocusable = false
                        }

                        scrollY >= 0 && scrollY <= activity.tagGoodsEnd.y -> {
                            activity.goodsTabs.setScrollPosition(0, 0f, true, true)
                        }
                        scrollY > activity.tagGoodsEnd.y && scrollY < activity.tagPinglun.y -> {
                            activity.goodsTabs.setScrollPosition(1, 0f, true, true)
                        }
                        scrollY > activity.tagPinglun.y -> {
                            activity.goodsTabs.setScrollPosition(2, 0f, true, true)
                        }

                        else -> {
                            activity.viewToolbar.visibility = View.VISIBLE
                            activity.viewToolbar.isFocusable = true
                            activity.viewToolbar.alpha = 1f
                        }
                    }
                })
            }

        }

        activity.goodsTabs.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabReselected(tab: TabLayout.Tab?) {
            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {
            }

            override fun onTabSelected(tab: TabLayout.Tab?) {
                tab?.let {
                    when (it.text) {
                        "商品" ->
                            activity.scroller.scrollTo(0, 0)
                        "评价" ->
                            activity.scroller.scrollTo(0, activity.tagGoodsEnd.y.toInt() + 1)
                        "详情" ->
                            activity.scroller.scrollTo(0, activity.tagPinglun.y.toInt() + 1)
                    }
                }
            }

        })
    }

//    private fun getCoupon() {
//        rxLifeScope.launch {
//            app.wxInfo?.let {
//                val data = api.getGoodsCoupon(
//                    it.user_id,
//                    it.login_token,
//                    activity(activity).goodsId
//                )
//                if (data.code == 1) {
//                    goodsCouponAdapter.addData2(ArrayList(data.data))
//                    goodsCouponText = data.data.joinToString { coupon ->
//                        coupon.desc
//                    }
//                } else
//                    toast(data)
//            }
//
//        }
//    }

    private fun loadDetailsInfo() {
        rxLifeScope.launch {
            val data = if (app.wxInfo == null) {
                api.goodsDetails(activity(activity).goodsId, activity(activity).discountId)
            } else {
                api.goodsDetails(
                    app.wxInfo!!.user_id,
                    app.wxInfo!!.login_token,
                    activity(activity).goodsId,
                    activity(activity).discountId
                )
            }
            if (data.code == 1) {
                parseGoodsInfo(data.data)
                val scrollView =
                    activity.window.decorView.findViewById<NestedScrollView>(R.id.scroller)
                scrollView.post {
                    scrollView.smoothScrollTo(0, 0)
                }

                scrollView.postDelayed({
                    scrollView.scrollTo(0, 0)
                }, 300)
            } else {
                toast(data)
                if (data.message.equals("很抱歉，商品信息不存在或已下架")) {
                    Handler().postDelayed({ activity.finish() }, 2000)
                  }
            }
//            getCoupon()
        }
    }

    fun openNextProp() {
        when (propState) {
            1 -> addCart(skuIds)
            2 -> buyNow()
        }
    }

    fun showShop() {
        ARouter.getInstance().build(shopDetailsActivity).navigation()
    }

    fun showDetails() {
        ARouter.getInstance().build(goodsPingjiaActivity)
            .withString("goodsId", activity(activity).goodsId)
            .navigation(activity)
    }

    fun openShared() {
//        val uuid = UUID.randomUUID().toString()
//        OnekeyShare().sharedAndShow(
//            activity,
//            "https://www.bilibili.com/",
//            "https://pub.dev/static/img/landing-02.png?hash=kovu66p69ooehpeesdtgk689glke0kb1",
//            "我是一个商品${uuid}",
//            "优惠70%$uuid"
//        )
    }

    fun buyNow() {
        bottomSheet.dismiss()
        createOrder(
            activity,
            GoodsArr.createBy(
                details!!,
                hasSelectedPropName,
                skuGoodsPrice,
                skuIds,
                skuGoodsImage,
                goodsCount
            ),
            GoodsType.Self
        )
    }

    fun cart() {
        ARouter.getInstance().build(cartActivity).navigation()
    }

    override fun activity(activity: AppCompatActivity): GoodsDetailsActivity {
        return activity as GoodsDetailsActivity
    }

    private fun parseGoodsInfo(goodsDetails: GoodsDetailsResp2.DataBean) {
        details = goodsDetails
        wrapImages(
            ""/*goodsDetails.video_url*/,
            goodsDetails.goods_images
        )


        propSKUArray.clear()
        goodsDetails.sku_list?.let {
            propSKUArray.addAll(goodsDetails.sku_list)
        }
        if (propSKUArray.size > 0) {
            val skuDefault = propSKUArray[0]
            goodsAllCount = skuDefault.stock_num
            goodsPrice = skuDefault.goods_price
            marketGoodsPrice = skuDefault.line_price
            hasSale = skuDefault.goods_sales
            goodsPingjiaCount = goodsDetails.comment_data_count
            goodsPingjia.addData2(ArrayList(goodsDetails.comment_data))
            goodsContent = goodsDetails.content
            skuIds = skuDefault.goods_sku_id
        }

        goodsName = goodsDetails.goods_name
        goodsCollection = goodsDetails.collected_status == "2"
//        if (goodsDetails.discount.isNotEmpty()) {
//            discount = goodsDetails.discount[0]
//            discountId = discount!!.discount_id
//            startBroadcast(discount!!.end_time)
//            canBuy = discount!!.start_time.toLong() * 1000 < System.currentTimeMillis()
//        }
//        services = goodsDetails.goods_service.joinToString {
//            it.service_name
//        }
        for (i in 0 until goodsDetails.spec_attr.size) {
            val item: ViewPropPropsBinding = DataBindingUtil.inflate(
                LayoutInflater.from(activity),
                R.layout.view_prop_props,
                null,
                false
            )

            val adapter = FlowAdapter<GoodsDetailsResp2.DataBean.SpecAttrBean.SpecItemsBean>(
                item.flow,
                GoodsPropValueDelegate(i, this)
            )
            goodsPropAdapters.add(adapter)
            adapter.clear()
            adapter.setData(ArrayList(goodsDetails.spec_attr[i].spec_items))
            item.data = goodsDetails.spec_attr[i]
            item.pos = i
            item.vm = this
//            item.adapter = adapter
            propWrapper.prop.addView(item.root)
        }
        for (i in 0 until goodsPropAdapters.size) {
            propArray.add(goodsPropAdapters[i].data[0])
        }
        toPropName(propArray)
        computePropVersion1()
    }

    private fun toPropName(data: ArrayList<GoodsDetailsResp2.DataBean.SpecAttrBean.SpecItemsBean>) {
        if (data.isEmpty()) {
            skuGoodsMarketPrice = marketGoodsPrice
            skuGoodsPrice = goodsPrice
        } else {
            var propName = ""
            for (i in data) {
                propName += i.spec_value
                propName += "  "
            }
            hasSelectedPropName = propName
            Log.d("selectProp", propName)
        }
    }

    override fun onReady() {
        super.onReady()
        loadDetailsInfo()
    }

    fun selectCoupon() {
        bottomSheetCoupon.show()
    }

    fun selectProp(state: Int) {
        propState = state
        bottomSheet.show()
    }

    fun selectPropIndex(propIndex: Int, pos: Int) {
        goodsPropAdapters[propIndex].refresh(pos)
        propArray[propIndex] = goodsPropAdapters[propIndex].data[pos]
        toPropName(propArray)
        computePropVersion1()
    }



    /**
     * version 1
     * 计算skuProp
     *
     */
    private fun computePropVersion1() {
        var skuSelected: GoodsDetailsResp2.DataBean.SkuListBean? = null
        for (sku in propSKUArray) {
            var propCount = 0
            sku.let {
                val allIds = sku.spec_sku_id.split("_")
                for (prop in propArray) {
                    if (allIds.contains(prop.item_id)) {
                        propCount++
                    }
                }
            }
            if (propCount == propArray.size) {
                skuSelected = sku
                skuIds = sku.goods_sku_id
                break
            }
        }
        skuSelected?.let {
            skuGoodsCount = it.stock_num
            skuGoodsImage = it.image
            skuGoodsPrice = it.goods_price
            skuGoodsMarketPrice = it.line_price
        }
    }

    fun collection() {
        app.wxInfo?.let {
            rxLifeScope.launch {
                val resp =
                    api.collect(
                        it.user_id,
                        it.login_token,
                        activity(activity).goodsId,
                        !goodsCollection
                    )
                if (resp.code == 1) {
                    goodsCollection = !goodsCollection
                }
                toast(resp)
            }
        }
    }

    private var loopJob: Job? = null
    private fun broadcast(endTime: String) {

        val end: Long = endTime.toLong() * 1000
        var time = end - System.currentTimeMillis()
        time /= 1000
        val second = time % 60
        val vSecond = when {
            second >= 10 -> "$second"
            second < 0 -> "59"
            else -> {
                "0$second"
            }
        }
        time /= 60
        val minute = time % 60
        val vMinute = when {
            minute >= 10 -> "$minute"
            second < 0 -> "59"
            else -> {
                "0$minute"
            }
        }
        time /= 60
        val hour = time % 60
        val vHour = when {
            hour >= 10 -> "$hour"
            second < 0 -> "99"
            else -> {
                "0$hour"
            }
        }
        discountTimeText = "距结束还有$vHour:$vMinute:$vSecond"
    }

    private fun startBroadcast(endTime: String) {
        loopJob = GlobalScope.launch(Dispatchers.IO) {
            while (true) {
                delay(1000)
                withContext(Dispatchers.Main) {
                    broadcast(endTime)
                }
            }
        }
    }

    private fun wrapImages(video: String, imgs: List<String>) {
        val goods = ArrayList<GoodsBanner>()
        for (i in imgs) {
            goods.add(GoodsBanner(i))
        }
        if (TextUtils.isEmpty(video)) {
            bannerAdapter.setData(goods)
        } else
            bannerAdapter.setData(video, goods)
    }

    fun receiveCoupon(pos: Int, cData: GoodsCouponData.DataBean) {
//        app.wxInfo?.let {
//            rxLifeScope.launch {
//                val data =
//                    api.receiveCoupon(cData.coupon_type_id, it.user_id, it.login_token)
//                if (data.code == 1) {
//                    goodsCouponAdapter.data[pos].status = "2"
//                    goodsCouponAdapter.notifyItemChanged(pos)
//                }
//                toast(data)
//            }
//        }

    }

    fun addCart(skuId: String) {
        rxLifeScope.launch {
            val data = if (discountId.isEmpty()) {
                api.addCart(
                    activity(activity).goodsId,
                    skuId,
                    goodsCount,
                    app.wxInfo!!.user_id,
                    app.wxInfo!!.login_token
                )
            } else {
                api.addCart(
                    activity(activity).goodsId,
                    skuId,
                    goodsCount,
                    discountId,
                    app.wxInfo!!.user_id,
                    app.wxInfo!!.login_token
                )
            }

            if (data.code == 1) {
                goodsCartCount++
                toast("添加成功")
                bottomSheet.dismiss()
            } else {
                toast(data)
            }

        }
    }

    fun countAdd() {
        goodsCount++
    }

    fun countSub() {
        goodsCount--
    }
}

fun <T> Iterable<T>.joinToString(
    separator: CharSequence = "·",
    prefix: CharSequence = "",
    postfix: CharSequence = "",
    limit: Int = -1,
    truncated: CharSequence = "...",
    transform: ((T) -> CharSequence)? = null
): String {
    return joinTo(
        StringBuilder(),
        separator,
        prefix,
        postfix,
        limit,
        truncated,
        transform
    ).toString()
}


fun <T> Iterable<T>.joinToString_(
    separator: CharSequence = "_",
    prefix: CharSequence = "",
    postfix: CharSequence = "",
    limit: Int = -1,
    truncated: CharSequence = "...",
    transform: ((T) -> CharSequence)? = null
): String {
    return joinTo(
        StringBuilder(),
        separator,
        prefix,
        postfix,
        limit,
        truncated,
        transform
    ).toString()
}

fun <T> Iterable<T>.joinToString1 (
    separator: CharSequence = ",",
    prefix: CharSequence = "",
    postfix: CharSequence = "",
    limit: Int = -1,
    truncated: CharSequence = "...",
    transform: ((T) -> CharSequence)? = null
): String {
    return joinTo(
        StringBuilder(),
        separator,
        prefix,
        postfix,
        limit,
        truncated,
        transform
    ).toString()
}