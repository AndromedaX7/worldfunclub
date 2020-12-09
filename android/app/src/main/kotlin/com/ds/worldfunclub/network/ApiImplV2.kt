package com.ds.worldfunclub.network

import android.text.TextUtils
import android.util.Log
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.responsebean.*
import com.ds.worldfunclub.viewmodel.joinToString1
import com.ds.worldfunclub.viewmodel.joinToStringWithDownLine
import rxhttp.retry
import rxhttp.toClass
import rxhttp.tryAwait
import rxhttp.wrapper.param.RxHttp
import java.io.File

class ApiImplV2 : Api {

    var baseUrl = "http://shop.tule-live.com/index.php"

    override suspend fun uploadWechatAuthCode(code: String): LoginInfo {
        Log.e("code", "code is:$code")
        return RxHttp.postForm("${baseUrl}/api/Login/wechatLogin").add("token", code)
            .toClass<LoginInfo>().await()
    }

    override suspend fun smsCodeBindPhoneAccount(
        userId: String,
        phone: String,
        token: String
    ): SendSMSCode {
        return RxHttp.postForm("${baseUrl}/api/Login/sendMessage")
            .add("user_id", userId)
            .add("mobile_number", phone)
            .add("login_token", token)
            .add("type", 1)
            .toClass<SendSMSCode>().await()
    }

    override suspend fun smsCodeLogin(phone: String): SendSMSCode {
        return RxHttp.postForm("${baseUrl}/api/Login/sendMessage")
            .add("mobile_number", phone)
            .add("type", 2)
            .toClass<SendSMSCode>().await()
    }

    override suspend fun login(mobileLogin: String, code: String): LoginInfo {
        return RxHttp.postForm("${baseUrl}/api/Login/mobileLogin")
            .add("mobile_number", mobileLogin)
            .add("verify_code", code)
            .toClass<LoginInfo>().await()
    }

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

    override suspend fun homeCategory(): HomeCategory? {
        return RxHttp.postForm("${baseUrl}/api/Category/index")
            .add("time", System.currentTimeMillis())
            .toClass<HomeCategory>()
            .retry(times = 5)
            .tryAwait()
    }

//    override suspend fun splashImage(): SplashImageData {
//        return api.splashImage()
//    }

//    override suspend fun searchGoods(key_word: String, page: Int, type: Int): SearchGoodsData {
//        return api.searchGoods(key_word, page, type)
//    }

//    override suspend fun searchGoodsWithPrice(
//        key_word: String,
//        page: Int,
//        sort: Int
//    ): SearchGoodsData {
//        return api.searchGoodsWithPrice(key_word, page, sort)
//    }

    override suspend fun writeOff(order_id: String, user_id: String, token: String): ShopBalance {
        return RxHttp.postForm("$baseUrl/api/shop.order/extract")
            .add("order_id", order_id)
            .add("user_id", user_id)
            .add("token", token)
            .toClass<ShopBalance>()
            .await()
    }

    override suspend fun categoryGoods(
        category_id: String,
        self: Boolean,
        choice: String,
        page: Int
    ): CategoryGoods {
        return RxHttp.postForm("${baseUrl}/api/Goods/lists")
            .add("category_id", category_id)
            .add("goods_type", if (self) 1 else 2)
            .add("page", page)
            .add("choice", choice)
            .toClass<CategoryGoods>()
            .await()
    }

//    override suspend fun getDiscountList(): DiscountList {
//        return api.getDiscountList()
//    }

//    override suspend fun getDiscountGoods(id: String): DiscountGoods {
//        return api.getDiscountGoods(id)
//    }

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

    override suspend fun goodsDetailsLive(
        user_id: String,
        login_token: String,
        id: String,
        discount_id: String
    ): GoodsDetailsResp3 {
        val param = RxHttp.postForm("$baseUrl/api/Goods/detail")
            .add("goods_id", id)
            .add("user_id", user_id)
            .add("login_token", login_token)
        if (!TextUtils.isEmpty(discount_id)) {
            param.add("discount_id", discount_id)
        }
        return param.toClass<GoodsDetailsResp3>()
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

//    override suspend fun getGoodsCoupon(
//        user_id: String,
//        login_token: String,
//        goods_id: String
//    ): GoodsCouponData {
//        return api.getGoodsCoupon(user_id, login_token, goods_id)
//    }

//    override suspend fun goodsSKU(
//        user_id: String,
//        login_token: String,
//        goods_id: String,
//        sku_str: String
//    ): SkuData {
//        return api.goodsSKU(user_id, login_token, goods_id, sku_str)
//    }
//
//    override suspend fun goodsSKU(goods_id: String, sku_str: String): SkuData {
//        return api.goodsSKU(goods_id, sku_str)
//    }
//
//    override suspend fun receiveCoupon(
//        coupon_type_id: String,
//        user_id: String,
//        login_token: String
//    ): BaseResponse {
//        return api.receiveCoupon(coupon_type_id, user_id, login_token)
//    }


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

    override suspend fun increaseCartNum(
        num: String,
        cart_id: String,
        user_id: String,
        login_token: String
    ): BaseResponse {
//
        TODO("不用这个")
    }

    override suspend fun getDefaultAddress(
        user_id: String,
        login_token: String
    ): DefaultAddress {
        return RxHttp.postForm("$baseUrl/api/User/defaultAddress")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .toClass<DefaultAddress>()
            .await()
    }

    override suspend fun userAddressList(user_id: String, login_token: String): AddressData {
        return RxHttp.postForm("$baseUrl/api/Address/lists")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .toClass<AddressData>()
            .await()
    }

    override suspend fun addAddress(
        user_id: String,
        login_token: String,
        region: String,
        name: String,
        phone: String,
        detail: String,
        is_default: Boolean

    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/Address/add")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("region", region)
            .add("name", name)
            .add("phone", phone)
            .add("detail", detail)
            .add("is_default", if (is_default) "2" else "1")
            .toClass<BaseResponse>()
            .await()
    }

    override suspend fun editAddress(
        address_id: String,
        user_id: String,
        login_token: String,
        region: String,
        name: String,
        phone: String,
        detail: String,
        is_default: Boolean
    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/Address/edit")
            .add("address_id", address_id)
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("region", region)
            .add("name", name)
            .add("phone", phone)
            .add("detail", detail)
            .add("is_default", if (is_default) "2" else "1")
            .toClass<BaseResponse>()
            .await()
    }

    override suspend fun delAddress(
        user_id: String,
        login_token: String,
        id: String
    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/Address/delete")
            .add("user_id", user_id)
            .add("address_id", id)
            .add("login_token", login_token)
            .toClass<BaseResponse>()
            .await()
    }

    override suspend fun delCart(
        user_id: String,
        login_token: String,
        cart_ids: List<String>
    ): BaseResponse {
//
        return RxHttp.postJson("$baseUrl/api/Cart/deleteCart")
            .add("user_id", user_id)
            .add("cart_ids", cart_ids.joinToString { it })
            .add("login_token", login_token)
            .toClass<BaseResponse>()
            .await()
    }

    /**
     * 1微信 2支付宝 3 涂乐币
     */
    override suspend fun createOrder(
        user_id: String,
        login_token: String,
        goods_money: String,
        self: GoodsType,
        address_id: String,
        pay_type: PayType,
        pay_from: PayFrom,
        goods_arr: List<GoodsArr2>
    ): CreateOrderResp {
        return when (pay_from) {
            PayFrom.Cart -> buyCart(
                user_id,
                login_token,
                goods_money,
                self,
                address_id,
                pay_type,
                goods_arr
            )
            PayFrom.GoodsDetails -> buyNow(
                user_id,
                login_token,
                goods_money,
                self,
                address_id,
                pay_type,
                goods_arr[0]
            )
        }
    }

//    override suspend fun getUserCoupon(
//        user_id: String,
//        login_token: String,
//        goods_money: String
//    ): UserCoupon {
//        return api.getUserCoupon(user_id, login_token, goods_money)
//    }


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

    override suspend fun payBalance(
        user_id: String,
        login_token: String,
        order_id: String
    ): BalancePayAuthBean {
        return RxHttp.postForm("$baseUrl/api/order/orderAuth")
            .add("user_id", user_id)
            .add("order_id", order_id)
            .add("login_token", login_token)
            .add("pay_type", "10")
            .toClass<BalancePayAuthBean>()
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

    override suspend fun express(
        order_id: String,
        order_goods_id: String,
        user_id: String,
        login_token: String
    ): ExpressBean {
        return RxHttp.postForm("$baseUrl/api/user.order/express")
            .add("order_id", order_id)
            .add("order_goods_id", order_goods_id)
            .add("user_id", user_id)
            .add("login_token", login_token)
            .toClass<ExpressBean>().await()
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

fun <T> Iterable<T>.joinToString2(
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