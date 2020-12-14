package com.ds.worldfunclub.network

import android.text.TextUtils
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.responsebean.*
import rxhttp.toClass
import rxhttp.wrapper.param.RxHttp

class ApiImplV2 : Api {

    var baseUrl = "http://shop.tule-live.com/index.php"


    override suspend fun goodsDetails(
            user_id: String,
            login_token: String,
            id: String,
            discount_id: String
    ): GoodsDetailsResp2 {
        val param = RxHttp.postForm("$baseUrl/api/Goods/detail")
                .add("goods_id", id)
                .add("user_id", user_id)
                .add("login_token", login_token)
        if (!TextUtils.isEmpty(discount_id)) {
            param.add("discount_id", discount_id)
        }
        return param.toClass<GoodsDetailsResp2>()
                .await()
    }


    override suspend fun goodsDetails(id: String, discount_id: String): GoodsDetailsResp2 {
        val param = RxHttp.postForm("$baseUrl/api/Goods/detail")
                .add("goods_id", id)
        if (!TextUtils.isEmpty(discount_id)) {
            param.add("discount_id", discount_id)
        }
        return param.toClass<GoodsDetailsResp2>()
                .await()
    }

    override suspend fun collect(
            userId: String,
            token: String,
            goods_id: String,
            collect: Boolean
    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/Goods/dealCollection")
                .add("user_id", userId)
                .add("login_token", token)
                .add("goods_id", goods_id)
                .add("collection_type", if (collect) 2 else 1)
                .toClass<BaseResponse>().await()
    }

    override suspend fun destroyUser(user_id: String, token: String): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/User/cancelUser")
                .add("user_id", user_id)
                .add("login_token", token)
                .toClass<BaseResponse>()
                .await()
    }


    override suspend fun loadEvaluationList(
            user_id: String, login_token: String, page: Int,
            type: EvaluationType, goods_id: String
    ): CommentData {
        return RxHttp.postForm("$baseUrl/api/Comment/getCommentlists")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .add("goods_id", goods_id)
                .add("comment_type", type.value)
                .add("page", page)
                .toClass<CommentData>()
                .await()
    }

    override suspend fun addCommentThumbs(
            app: App,
            evaluate_id: String,
            type: String
    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/Comment/handleComment")
                .add("user_id", app.wxInfo!!.user_id)
                .add("login_token", app.wxInfo!!.login_token)
                .add("comment_id", evaluate_id)
                .add("handle_type", type)
                .toClass<BaseResponse>()
                .await()
    }

    override suspend fun addCart(
            goods_id: String,
            sku_id: String,
            num: Int,
            user_id: String,
            login_token: String
    ): BaseResponse {
        val req = RxHttp.postForm("$baseUrl/api/Cart/add")
                .add("goods_id", goods_id)
        if (sku_id.isNotEmpty())
            req.add("goods_sku_id", sku_id)
        return req.add("goods_num", num)
                .add("user_id", user_id)
                .add("login_token", login_token)
                .toClass<BaseResponse>()
                .await()
    }

    override suspend fun addCart(
            goods_id: String,
            sku_id: String,
            num: Int,
            discount_id: String,
            user_id: String,
            login_token: String
    ): BaseResponse {
        val req = RxHttp.postForm("$baseUrl/api/Cart/add")
                .add("goods_id", goods_id)
        if (sku_id.isNotEmpty())
            req.add("goods_sku_id", sku_id)
        return req.add("goods_num", num)
                .add("user_id", user_id)
                .add("login_token", login_token)
                .toClass<BaseResponse>()
                .await()
    }

}