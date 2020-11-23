package com.ds.worldfunclub.ui.delegate

import android.view.LayoutInflater
import androidx.databinding.DataBindingUtil
import androidx.recyclerview.widget.RecyclerView
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.databinding.ItemGoodsContentBinding
import com.ds.worldfunclub.responsebean.GoodsDetailsResp
import com.ds.worldfunclub.responsebean.GoodsDetailsResp2
import com.ds.worldfunclub.responsebean.Pingjia
import com.ds.worldfunclub.viewmodel.PingjiaDetailsModel
import kotlinx.android.synthetic.main.item_goods_pingjia2.view.*

class GoodsPingjiaDelegate0 (model:ThumbsHandler,  showThub:Boolean): AbsGoodsPingjiaDelegate(model,showThub) {
    override fun layoutId() = R.layout.item_goods_pingjia0

    override fun isForViewType(item: GoodsDetailsResp2.DataBean.CommentDataBean?): Boolean {
        return item?.images?.size == 0 || item?.images == null
    }
}

class GoodsPingjiaDelegate1(model:ThumbsHandler, showThub:Boolean): AbsGoodsPingjiaDelegate(model,showThub) {
    override fun layoutId() = R.layout.item_goods_pingjia1

    override fun isForViewType(item: GoodsDetailsResp2.DataBean.CommentDataBean?): Boolean {
        return item?.images?.size == 1
    }
}

class GoodsPingjiaDelegate2 (model:ThumbsHandler, showThub:Boolean): AbsGoodsPingjiaDelegate(model,showThub) {
    override fun layoutId() = R.layout.item_goods_pingjia2


    override fun onBindViewHolder(
        viewHolder: RecyclerView.ViewHolder?,
        pos: Int,
        item:GoodsDetailsResp2.DataBean.CommentDataBean?,
        dataSize: Int
    ) {
        super.onBindViewHolder(viewHolder, pos, item, dataSize)
        val vh = viewHolder as RecyclerBindingViewHolder
        vh.binding.root.grid.removeAllViews()
        item?.images?.let {

            for (i in 0 until it.size) {
                val items: ItemGoodsContentBinding = DataBindingUtil.inflate(
                    LayoutInflater.from(vh.binding.root.context),
                    R.layout.item_goods_content,
                    vh.binding.root.grid,
                    false
                )
                items.img=it[i]
                vh.binding.root.grid.addView(items.root)
            }

        }
    }


    override fun isForViewType(item: GoodsDetailsResp2.DataBean.CommentDataBean?): Boolean {
        return item?.images?.size ?: 0 in 2..9
    }
}