package com.ds.worldfunclub.ui

import android.content.Context
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.SharedElementHelper
import com.ds.worldfunclub.app.goodsDetailsActivity
import com.ds.worldfunclub.app.orderConfirmActivity
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.responsebean.GoodsArr

interface CallGoodsDetails {
    fun goodsDetails(v: View, goodsId: String) {
        val bundle = SharedElementHelper.toGoodsDetails(v)
        if (bundle == null) {
            ARouter.getInstance().build(goodsDetailsActivity)
                .withString("goodsId", goodsId)
                .navigation(v.context)
        } else {
            ARouter.getInstance().build(goodsDetailsActivity)
                .withString("goodsId", goodsId)
//                .withOptionsCompat(bundle)
                .navigation(v.context)
        }
    }

    fun goodsDetails(v: View, goodsId: String, discountId: String) {
        val bundle = SharedElementHelper.toGoodsDetails(v)
        if (bundle == null) {
            ARouter.getInstance().build(goodsDetailsActivity)
                .withString("goodsId", goodsId)
                .withString("discountId",discountId)
                .navigation(v.context)
        } else {
            ARouter.getInstance().build(goodsDetailsActivity)
                .withString("goodsId", goodsId)
                .withString("discountId",discountId)
//                .withOptionsCompat(bundle)
                .navigation(v.context)
        }
    }

    fun goodsDetails(v: View) {
//        val bundle = SharedElementHelper.toGoodsDetails(v)
//        if (bundle == null) {
////            ARouter.getInstance().build()
//            ARouter.getInstance().build(goodsDetailsActivity)
////                .withString("goodsId",goodsId)
//                .navigation(v.context)
//        } else {
//            ARouter.getInstance().build(goodsDetailsActivity)
////                .withString("goodsId",goodsId)
//                .withOptionsCompat(bundle).navigation(v.context)
//        }

        goodsDetails(v,"12")
    }
}
interface CallOrderCreate{
    companion object{
        val order_comfirm_req=10
    }
    fun createOrder (context:Context,goodsInfo:GoodsArr,self:GoodsType){
        ARouter.getInstance().build(orderConfirmActivity)
            .withParcelable("goods",goodsInfo)
            .withString("self",self.value)
            .withBoolean("buyOne",true)
            .navigation(context)
    }
    fun createOrder (context:AppCompatActivity,goodsInfo:ArrayList<GoodsArr>,self:GoodsType){
        ARouter.getInstance().build(orderConfirmActivity)
            .withParcelableArrayList("goodsAll",goodsInfo)
            .withString("self",self.value)
            .withBoolean("buyOne",false)
            .navigation(context, order_comfirm_req)
    }
}