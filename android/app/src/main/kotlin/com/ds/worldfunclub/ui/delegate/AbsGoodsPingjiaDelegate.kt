package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.GoodsDetailsResp
import com.ds.worldfunclub.responsebean.GoodsDetailsResp2

abstract class AbsGoodsPingjiaDelegate(val model: ThumbsHandler,val showThumbs:Boolean) :
    BindingDelegate2<GoodsDetailsResp2.DataBean.CommentDataBean>() {


    fun onTab(pos: Int,data: GoodsDetailsResp2.DataBean.CommentDataBean) {
        if (data.is_thumb == "1") {
            data.is_thumb = "2"
            try {
                data.thumb_num = "${data.thumb_num.toInt() - 1}"
            } catch (e: NumberFormatException) {

            }
        } else {
            data.is_thumb = "1"
            try {
                data.thumb_num = "${data.thumb_num.toInt() + 1}"
            } catch (e: NumberFormatException) {

            }
        }
        model.addCommentThumbs(pos,data.comment_id, data.is_thumb)
    }
}

interface ThumbsHandler {
    fun addCommentThumbs(pos :Int,evaluateId: String, isThumbs: String)
}