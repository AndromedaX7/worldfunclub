package com.ds.worldfunclub.viewmodel

import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import androidx.lifecycle.rxLifeScope
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.BannerData
import com.ds.worldfunclub.responsebean.CategoryGoods
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.adapter.BannerAdapter
import com.ds.worldfunclub.ui.delegate.BannerBeanAdapter
import com.ds.worldfunclub.ui.delegate.LiveMoreDelegate
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/21 10:30
 */
@FragmentScope
class LiveTabModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api

) : BaseModel(activity.requireContext()) {
    lateinit var item: HomeCategory.DataBean

    @get:Bindable
    val bannerAdapter = BannerAdapter(false)

    @get:Bindable
    val bannerBean = BannerBeanAdapter()

    @get:Bindable
    var bannerCount = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.bannerCount)
        }

    fun init(data: HomeCategory.DataBean) {
        this.item=data
        rxLifeScope.launch {
            val res = api.categoryGoods(data.category_id, false,"1", page)
            canLoad = if (res.code == 1) {
                adapter.addData2(ArrayList( res.data))
                true
            }else
                false
        }
        rxLifeScope.launch {
            val banner = api.banner(data.category_id, "1")
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

    @get:Bindable
    val adapter = MultiTypeAdapter<CategoryGoods.DataBean>()

    init {
        adapter.addDelegate(LiveMoreDelegate())
    }

    override fun loadMore() {
        super.loadMore()
        init(item)
    }

    override fun refresh(r: SwipeRefreshLayout) {
        super.refresh(r)
        adapter.clear()
        init(item)
    }
}