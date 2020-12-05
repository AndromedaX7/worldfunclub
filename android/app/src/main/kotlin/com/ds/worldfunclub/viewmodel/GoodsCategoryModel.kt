package com.ds.worldfunclub.viewmodel

import android.content.Intent
import android.util.SparseArray
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityOptionsCompat
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.BannerData
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.ui.activity.SearchActivity
import com.ds.worldfunclub.ui.delegate.GoodsCategoryDelegate
import com.ds.worldfunclub.ui.delegate.GoodsCategoryLevel1Delegate
import kotlinx.android.synthetic.main.activity_goods_category.*
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/9 2:34
 */
@ActivityScope
class GoodsCategoryModel @Inject constructor(
        val activity: AppCompatActivity,
        val app: App, val api: Api
) : BaseModel(activity) {
    fun show(pos: Int) {
        level2.clear()
        data[pos].child?.let {
            level2.addData2(ArrayList(it))
        }
        var cb = banner[pos]
        if (cb == null)
            categoryBanner(pos, data[pos].category_id)
        else
            bannerIcon = cb
    }

    @get:Bindable
    var bannerIcon: BannerData.DataBean = BannerData.DataBean()
        set(value) {
            field = value
            notifyPropertyChanged(BR.bannerIcon)
        }
    val data = ArrayList<HomeCategory.DataBean>()
    val banner = SparseArray<BannerData.DataBean>()
    val level2 = MultiTypeAdapter<HomeCategory.DataBean.ChildBean>()

    @get:Bindable
    val level1 = MultiTypeAdapter<HomeCategory.DataBean>()

    init {
        level1.addDelegate(
                GoodsCategoryLevel1Delegate(
                        this
                )
        )
        level2.addDelegate(GoodsCategoryDelegate())
        category()

    }


    fun openSearch() {
        activity.startActivity(
                Intent(activity, SearchActivity::class.java)
        )
    }

    private fun category() {
        rxLifeScope.launch {
            val category = api.homeCategory()
            category?.let {
                if (it.code == 1) {
                    val itr = it.data.iterator()
                    while (itr.hasNext()) {
                        val next = itr.next()
                        if (next.category_type != "1") {
                            itr.remove()
                        }
                    }

                    level1.addData2(ArrayList(it.data))
                    data.addAll(it.data)
                    show(0)
                }
            }
        }
    }

    private fun categoryBanner(pos: Int, cid: String) {
        rxLifeScope.launch {
            val data = api.banner(cid, "2")
            if (data.code == 1) {
                if (data.data.isNotEmpty()) {
                    banner.put(pos, data.data[0])
                    bannerIcon = data.data[0]
                }
            }
        }
    }
}

