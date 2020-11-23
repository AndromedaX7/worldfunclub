package com.ds.worldfunclub.ui.adapter

import android.view.View
import android.view.ViewGroup
import android.webkit.WebView
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import androidx.viewpager.widget.PagerAdapter
import com.ds.worldfunclub.base.DataBindingAdapter
import com.ds.worldfunclub.base.createSettings
import com.ds.worldfunclub.widget.VideoPlayer

class GoodsBannerAdapter : PagerAdapter() {

    private val data = arrayListOf<GoodsBanner>()

    override fun isViewFromObject(view: View, `object`: Any) = view == `object`

    override fun getCount(): Int {
        return data.size
    }

    override fun instantiateItem(container: ViewGroup, position: Int): Any {
        val i = data[position]
        if (i.video) {
            val wrap = FrameLayout(container.context)
//            val content = VideoPlayer(container.context)
//            content.layoutParams = ViewGroup.LayoutParams(
//                DataBindingAdapter.dp2px(container.context, 375),
//                DataBindingAdapter.dp2px(container.context, 375)
//            )
//            content.setOnClickListener {
//                if (content.isPlaying) {
//                    content.pause()
//                } else {
//                    content.start()
//                }
//            }
//            content.setVideoPath(i.image)

            val content =WebView(container.context)
            content.createSettings()
            wrap.addView(
                content,
                FrameLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.MATCH_PARENT
                )
            )
            content.loadUrl(i.image)
//            val content2 = ImageView(container.context)
//            content2.layoutParams = ViewGroup.LayoutParams(
//                DataBindingAdapter.dp2px(container.context, 375),
//                DataBindingAdapter.dp2px(container.context, 375)
//            )
//            content2.scaleType = ImageView.ScaleType.FIT_XY
//            DataBindingAdapter.imageUrl(content2, i.image)
//            wrap.addView(
//                content2,
//                FrameLayout.LayoutParams(
//                    LinearLayout.LayoutParams.MATCH_PARENT,
//                    LinearLayout.LayoutParams.MATCH_PARENT
//                )
//            )
            container.addView(
                wrap,
                ViewGroup.LayoutParams(
                    DataBindingAdapter.dp2px(container.context, 375),
                    DataBindingAdapter.dp2px(container.context, 375)
                )
            )
            return wrap
        } else {
            val content = ImageView(container.context)
            content.layoutParams = ViewGroup.LayoutParams(
                DataBindingAdapter.dp2px(container.context, 375),
                DataBindingAdapter.dp2px(container.context, 375)
            )
            content.scaleType = ImageView.ScaleType.FIT_XY
            DataBindingAdapter.imageUrl(content, i.image)
            container.addView(content)
            return content
        }

    }

    override fun destroyItem(container: ViewGroup, position: Int, `object`: Any) {
        if (container.getChildAt(position) is VideoPlayer) {
            (container.getChildAt(position) as VideoPlayer).stopPlayback()
        }

        container.removeView(`object` as View)
    }

    fun setData(video: String, data: ArrayList<GoodsBanner>) {
        this.data.clear()
        this.data.addAll(data)
        this.data.add(GoodsBanner(video, true))
        notifyDataSetChanged()
    }

    fun setData(data: ArrayList<GoodsBanner>) {
        this.data.clear()
        this.data.addAll(data)
        notifyDataSetChanged()
    }

}

data class GoodsBanner(val image: String, val video: Boolean = false)