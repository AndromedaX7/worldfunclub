package com.ds.worldfunclub.network

import android.text.TextUtils
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.responsebean.*
import com.ds.worldfunclub.viewmodel.joinToString1
import com.ds.worldfunclub.viewmodel.joinToStringWithDownLine
import rxhttp.toClass
import rxhttp.wrapper.param.RxHttp
import java.io.File

class ApiImplV2 : Api {

    var baseUrl = "http://shop.tule-live.com/index.php"


    override suspend fun userBindMobile(
            userId: String,
            phone: String,
            token: String,
            code: String
    ): BaseResponse {
        return RxHttp.postForm("${baseUrl}/api/Login/userBindMobile")
                .add("user_id", userId)
                .add("mobile_number", phone)
                .add("login_token", token)
                .add("verify_code", code)
                .toClass<BaseResponse>().await()
    }

    override suspend fun writeOff(order_id: String, user_id: String, token: String): ShopBalance {
        return RxHttp.postForm("$baseUrl/api/shop.order/extract")
                .add("order_id", order_id)
                .add("user_id", user_id)
                .add("token", token)
                .toClass<ShopBalance>()
                .await()
    }

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


    override suspend fun increaseCartNum2(
            type: String,
            cart_id: String,
            user_id: String,
            login_token: String
    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/Cart/handleGoodsNum")
                .add("cart_id", cart_id)
                .add("type", type)
                .add("user_id", user_id)
                .add("login_token", login_token)
                .toClass<BaseResponse>()
                .await()
    }


    override suspend fun buyCart(
            user_id: String,
            login_token: String,
            goods_money: String,
            goods_type: GoodsType,
            address_id: String,
            pay_type: PayType,
            goods_attr: List<GoodsArr2>
    ): CreateOrderResp {
        return RxHttp.postForm("$baseUrl/api/order/cart")
                .add("cart_ids", goods_attr.map { it.cartId }.joinToString1 { it })
                .add("pay_type", pay_type.value)
                .add("goods_type", goods_type.value)
                .add("goods_money", goods_money)
                .add("address_id", address_id)
                .add("remark", goods_attr.map { it.remark }.joinToStringWithDownLine { it })
                .add("user_id", user_id)
                .add("login_token", login_token)
                .toClass<CreateOrderResp>()
                .await()
    }

    override suspend fun banner(category_id: String, rotation_type: String): BannerData {
        return RxHttp.postForm("${baseUrl}/api/Rotation/lists")
                .add("category_id", category_id)
                .add("rotation_type", rotation_type)
                .toClass<BannerData>()
                .await()
    }

    override suspend fun buyNow(
            user_id: String,
            login_token: String,
            goods_money: String,
            goods_type: GoodsType,
            address_id: String,
            pay_type: PayType,
            goods_attr: GoodsArr2
    ): CreateOrderResp {
        return RxHttp.postForm("$baseUrl/api/order/BuyNow")
                .add("goods_id", goods_attr.goods_id)
                .add("goods_num", goods_attr.buy_num)
                .add("goods_sku_id", goods_attr.sku_id)
                .add("pay_type", pay_type.value)
                .add("goods_type", goods_type.value)
                .add("goods_money", goods_money)
                .add("address_id", address_id)
                .add("remark", goods_attr.remark)
                .add("user_id", user_id)
                .add("login_token", login_token)
                .toClass<CreateOrderResp>()
                .await()
    }


    override suspend fun getUserOrderList(
            user_id: String,
            login_token: String,
            page: Int,
            order_type: OrderState
    ): OrderList {
        return RxHttp.postForm("$baseUrl/api/user.order/lists")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .add("page", page)
                .add("source", 1)
                .add("order_type", order_type.value)
                .toClass<OrderList>()
                .await()
    }

    override suspend fun getUserOrderLiveList(
            user_id: String,
            login_token: String,
            page: Int,
            order_type: OrderState
    ): OrderList {
        return RxHttp.postForm("$baseUrl/api/user.order/lists")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .add("page", page)
                .add("source", 2)
                .add("order_type", order_type.value)
                .toClass<OrderList>()
                .await()
    }

    override suspend fun getCollectList(
            user_id: String,
            login_token: String,
            page: Int
    ): CollectListBean {
        return RxHttp.postForm("$baseUrl/api/Collection/getCollectionList")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .add("page", page)
                .toClass<CollectListBean>().await()
    }

    override suspend fun deleteCollect(
            user_id: String,
            login_token: String,
            collect_id: String
    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/Collection/deleteCollection")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .add("collect_id", collect_id)
                .toClass<CollectListBean>().await()
    }


    override suspend fun loadScanInfo(url: String): ScanInfoBean {
        return RxHttp.get(url).toClass<ScanInfoBean>().await()
    }

    override suspend fun liveBuyNow(
            user_id: String,
            login_token: String,
            goods_id: String,
            goods_num: String,
            goods_sku_id: String,
            pay_type: String,
            goods_money: String,
            name: String,
            phone: String,
            subscribe_date: String,
            remark: String
    ): CreateOrderResp {
        return RxHttp.postForm("$baseUrl/api/order/lhBuyNow")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .add("goods_id", goods_id)
                .add("goods_num", goods_num)
                .add("goods_sku_id", goods_sku_id)
                .add("pay_type", pay_type)
                .add("goods_money", goods_money)
                .add("name", name)
                .add("phone", phone)
                .add("subscribe_date", subscribe_date)
                .add("remark", remark)
                .add("goods_type", "2")
                .toClass<CreateOrderResp>().await()
    }

    override suspend fun orderDetails(
            order_id: String,
            user_id: String,
            login_token: String
    ): OrderDetailsBean {
        return RxHttp.postForm("$baseUrl/api/user.order/detail")
                .add("order_id", order_id)
                .add("user_id", user_id)
                .add("login_token", login_token)
                .toClass<OrderDetailsBean>().await()
    }

    //    http://shop.tule-live.com/index.php/api/shop.order/getWriteOffList
    override suspend fun getWriteOffList(
            user_id: String,
            login_token: String,
            page: Int
    ): WriteOffBean {
        return RxHttp.postForm("$baseUrl/api/shop.order/getWriteOffList")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .add("page", page)
                .toClass<WriteOffBean>()
                .await()
    }


    override suspend fun getShopBalance(user_id: String, login_token: String): ShopBalance {
        return RxHttp.postForm("$baseUrl/api/shop/getShopBalance")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .toClass<ShopBalance>()
                .await()
    }

    override suspend fun saveComment(
            user_id: String,
            login_token: String,
            order_id: String,
            goods_id: String,
            star: Int,
            content: String,
            is_anonymous: String,
            files: List<File>
    ): BaseResponse {
        val req = RxHttp.postForm("$baseUrl/api/user.comment/saveComment")
                .add("user_id", user_id)
                .add("login_token", login_token)
                .add("order_id", order_id)
                .add("goods_id", goods_id)
                .add("star", star)
                .add("content", content)
                .add("is_anonymous", is_anonymous)

        for (i in 0 until files.size)
            req.addFile("comment[$i]", files[i])

        return req.toClass<BaseResponse>()
                .await()
    }


    override suspend fun bankList(user_id: String): BankListBean {
        return RxHttp.postForm("$baseUrl/api/user.bankcard/getBankcardList")
                .add("user_id", user_id)
                .toClass<BankListBean>()
                .await()
    }

    override suspend fun addBankCard(
            user_id: String,
            bank_name: String,
            bank_card: String,
            bank_account: String,
            holder: String,
            telephone: String
    ): BaseResponse {
        return RxHttp.postForm("${baseUrl}/api/user.bankcard/saveBankcard")
                .add("user_id", user_id)
                .add("bank_name", bank_name)
                .add("bank_card", bank_card)
                .add("bank_account", bank_account)
                .add("holder", holder)
                .add("telephone", telephone)
                .toClass<BaseResponse>()
                .await()
    }

    override suspend fun deleteBankCard(user_id: String, bankcard: String): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/user.bankcard/delBankcard")
                .add("user_id", user_id)
                .add("bankcard_id", bankcard)
                .toClass<BaseResponse>()
                .await()
    }

    override suspend fun withdrawList(user_id: String, page: Int): WithdrawBean {
//        http://shop.tule-live.com/index.php/api/user.Withdraw/applyWithdraw
        return RxHttp.postForm("$baseUrl/api/user.Withdraw/getWithdrawList")
                .add("user_id", user_id)
                .add("page", page)
                .toClass<WithdrawBean>()
                .await()
    }

    override suspend fun applyWithdraw(
            user_id: String,
            bankcard_id: String,
            money: String,
            pay_type: String
    ): BaseResponse {

        return RxHttp.postForm("$baseUrl/api/user.Withdraw/applyWithdraw")
                .add("user_id", user_id)
                .add("bankcard_id", bankcard_id)
                .add("money", money)
                .add("pay_type", pay_type)
                .toClass<BaseResponse>()
                .await()
    }

}