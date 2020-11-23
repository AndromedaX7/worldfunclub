package com.ds.worldfunclub.ui.adapter

import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import androidx.viewpager.widget.PagerAdapter
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.delicacyDetails
import com.ds.worldfunclub.base.DataBindingAdapter
import com.ds.worldfunclub.responsebean.BannerData
import com.ds.worldfunclub.ui.CallGoodsDetails

class BannerAdapter(val self: Boolean = true) : PagerAdapter(), CallGoodsDetails {

    private val data = arrayListOf<BannerData.DataBean>()

    override fun isViewFromObject(view: View, `object`: Any) = view == `object`

    override fun getCount(): Int {
        return data.size
    }

    override fun instantiateItem(container: ViewGroup, position: Int): Any {
        val i = data[position]
        val content = ImageView(container.context)
        content.scaleType = ImageView.ScaleType.FIT_XY
        DataBindingAdapter.imageUrl(content, i.img_url)
        content.setOnClickListener {
            if (self)
                goodsDetails(it, i.goods_id)
            else {
                ARouter.getInstance().build(delicacyDetails).withString("goodsId", i.goods_id)
                    .navigation(it.context)
            }
        }
        container.addView(content)
        return content
    }

    override fun destroyItem(container: ViewGroup, position: Int, `object`: Any) {
        container.removeView(`object` as View)
    }

    fun setData(data: ArrayList<BannerData.DataBean>) {
        this.data.clear()
        this.data.addAll(data)
        notifyDataSetChanged()
    }
}