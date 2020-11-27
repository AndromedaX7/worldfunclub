package com.ds.worldfunclub.network

import android.text.TextUtils
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.responsebean.*
import rxhttp.retry
import rxhttp.toClass
import rxhttp.tryAwait
import rxhttp.wrapper.param.RxHttp
import java.io.File

//@Docs(title = "网络请求实现")
class ApiImpl : Api {

    //    protected var baseUrl = "http://shop.tule-live.com/index.php"
    val baseUrl = "http://tule-live.com/index.php"

    init {
        RxHttp.setDebug(true)
    }


    override suspend fun uploadWechatAuthCode(code: String): LoginInfo {
        TODO("我也不知道这个留着有啥用了")
    }

    //    @Docs(title = "发送验证码", message = "绑定手机号时发送验证码用")
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
//            .add("user_id", userId)
            .add("mobile_number", phone)
//            .add("login_token", token)
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

    override suspend fun splashImage(): SplashImageData {
        return RxHttp.postForm("${baseUrl}/api/Startup/getAppStartimg")
            .toClass<SplashImageData>().await()
    }

    override suspend fun searchGoods(key_word: String, page: Int, type: Int): SearchGoodsData {
        return RxHttp.postForm("${baseUrl}/api/Goods/getSearchData")
            .add("page", page)
            .add("key_word", key_word)
            .add("type", type)
            .toClass<SearchGoodsData>().await()

    }

    override suspend fun searchGoodsWithPrice(
        key_word: String,
        page: Int,
        sort: Int
    ): SearchGoodsData {
        return RxHttp.postForm("${baseUrl}/api/Goods/getSearchData")
            .add("page", page)
            .add("key_word", key_word)
            .add("type", 3)
            .add("price_sort", sort)
            .toClass<SearchGoodsData>().await()
    }


    override suspend fun banner(category_id: String, rotation_type: String): BannerData {
        return RxHttp.postForm("${baseUrl}/api/Rotation/lists")
            .add("category_id", category_id)
            .add("rotation_type", rotation_type)
            .toClass<BannerData>()
            .await()
    }


    //    override suspend fun categoryGoods(
//        category_id: String,
//        level: String,
//        choice: Boolean,
//        page: Int
//    ): CategoryGoods {
//        return RxHttp.postForm("${baseUrl}/api/Goods/getCategoryGoods")
//            .add("category_id", category_id)
//            .add("level", level)
//            .add("type", if (choice) 2 else 1)
//            .add("page", page)
//            .toClass<CategoryGoods>()
//            .await()
//    }
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
            .toClass<CategoryGoods>()
            .await()
    }

    override suspend fun getDiscountList(): DiscountList {
        return RxHttp.postForm("${baseUrl}/api/Discount/getDiscountList")
            .add("time", System.currentTimeMillis())
            .toClass<DiscountList>()
            .await()
    }

    override suspend fun getDiscountGoods(id: String): DiscountGoods {
        return RxHttp.postForm("${baseUrl}/api/Discount/getDiscountGoods")
            .add("discount_id", id)
            .toClass<DiscountGoods>()
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


        return RxHttp.postForm("$baseUrl/api/Goodscollect/Collect")
            .add("user_id", userId)
            .add("login_token", token)
            .add("goods_id", goods_id)
            .add("type", if (collect) 1 else 2)
            .toClass<BaseResponse>().await()
    }

    override suspend fun getGoodsCoupon(
        user_id: String,
        login_token: String,
        goods_id: String
    ): GoodsCouponData {
        return RxHttp.postForm("$baseUrl/api/Coupon/getGoodsCoupon")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("goods_id", goods_id)
            .toClass<GoodsCouponData>()
            .await()
    }

    override suspend fun goodsSKU(
        user_id: String,
        login_token: String,
        goods_id: String,
        sku_str: String
    ): SkuData {
        return RxHttp.postForm("$baseUrl/api/goods/getGoodsSkuInfo")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("goods_id", goods_id)
            .add("sku_str", sku_str)
            .toClass<SkuData>()
            .await()
    }

    override suspend fun goodsSKU(goods_id: String, sku_str: String): SkuData {
        return RxHttp.postForm("$baseUrl/api/goods/getGoodsSkuInfo")
            .add("goods_id", goods_id)
            .add("sku_str", sku_str)
            .toClass<SkuData>()
            .await()
    }

    override suspend fun receiveCoupon(
        coupon_type_id: String,
        user_id: String,
        login_token: String
    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/Coupon/receiveCoupon")
            .add("coupon_type_id", coupon_type_id)
            .add("user_id", user_id)
            .add("login_token", login_token)
            .toClass<BaseResponse>()
            .await()
    }


    override suspend fun loadEvaluationList(
        user_id: String, login_token: String, page: Int,
        type: EvaluationType, goods_id: String
    ): CommentData {
        return RxHttp.postForm("$baseUrl/api/Goodsevaluate/getGoodsComment")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("goods_id", goods_id)
            .add("page", page)
            .add("type", type)
            .toClass<CommentData>()
            .await()
    }

    override suspend fun addCommentThumbs(
        app: App,
        evaluate_id: String,
        type: String
    ): BaseResponse {
        if (app.wxInfo != null) {
            return RxHttp.postForm("$baseUrl/api/Goodsevaluatethumbs/addCommentThumbs")
                .add("evaluate_id", evaluate_id)
                .add("type", type)
                .add("user_id", app.wxInfo!!.user_id)
                .add("login_token", app.wxInfo!!.login_token)
                .toClass<BaseResponse>()
                .await()
        } else
            return BaseResponse()

    }

    override suspend fun addCart(
        goods_id: String,
        sku_id: String,
        num: Int,
        user_id: String,
        login_token: String
    ): BaseResponse {
        val req = RxHttp.postForm("$baseUrl/api/GoodsCart/addCart")
            .add("goods_id", goods_id)
        if (sku_id.isNotEmpty())
            req.add("sku_id", sku_id)
        return req.add("num", num)
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
        val req = RxHttp.postForm("$baseUrl/api/GoodsCart/addCart")
            .add("goods_id", goods_id)
        if (sku_id.isNotEmpty())
            req.add("sku_id", sku_id)
        return req.add("num", num)
            .add("discount_id", discount_id)
            .add("user_id", user_id)
            .add("login_token", login_token)
            .toClass<BaseResponse>()
            .await()
    }

    override suspend fun getCartList(
        page: Int,
        user_id: String,
        login_token: String
    ): CartData2 {
        return RxHttp.postForm("$baseUrl/api/GoodsCart/getCartList")
            .add("page", page)
            .add("user_id", user_id)
            .add("login_token", login_token)
            .toClass<CartData2>()
            .await()
    }

    override suspend fun getCartList(
        user_id: String,
        login_token: String
    ): CartData2 {
        return RxHttp.postForm("$baseUrl/api/GoodsCart/getCartList")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .toClass<CartData2>()
            .await()
    }

    override suspend fun increaseCartNum(
        num: String,
        cart_id: String,
        user_id: String,
        login_token: String
    ): BaseResponse {
        return RxHttp.postForm("$baseUrl/api/GoodsCart/increaseCartNum")
            .add("cart_id", cart_id)
            .add("num", num)
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
        TODO("我也不知道这个留着有啥用了")
    }

    override suspend fun getDefaultAddress(
        user_id: String,
        login_token: String
    ): DefaultAddress {
        return RxHttp.postForm("$baseUrl/api/Address/getDefaultAddress")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .toClass<DefaultAddress>()
            .await()
    }

    override suspend fun userAddressList(user_id: String, login_token: String): AddressData {
        return RxHttp.postForm("$baseUrl/api/Address/userAddressList")
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
        return RxHttp.postForm("$baseUrl/api/Address/editAddress")
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
            .add("id", id)
            .add("login_token", login_token)
            .toClass<BaseResponse>()
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
        TODO("unused")
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
        TODO("Not yet implemented")
    }

    override suspend fun delCart(
        user_id: String,
        login_token: String,
        cart_ids: List<String>
    ): BaseResponse {
//        return RxHttp.postForm("$baseUrl/api/GoodsCart/delCart")
//            .add("user_id", user_id)
//            .add("cart_ids", cart_ids)
//            .add("login_token", login_token)
//            .toClass<BaseResponse>()
//            .await()

        return RxHttp.postJson("$baseUrl/api/GoodsCart/delCart")
            .add("user_id", user_id)
            .add("cart_ids", cart_ids)
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
        return RxHttp.postJson("$baseUrl/api/Order/createOrder")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("goods_money", goods_money)
            .add("goods_from", self.value)
            .add("address_id", address_id)
            .add("pay_type", pay_type.value)
            .add("goods_arr", goods_arr)
            .add("pay_from", pay_from.value)
            .toClass<CreateOrderResp>()
            .await()
    }

    override suspend fun getUserCoupon(
        user_id: String,
        login_token: String,
        goods_money: String
    ): UserCoupon {
        return RxHttp.postJson("$baseUrl/api/Coupon/getUserCoupon")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("goods_money", goods_money)
            .toClass<UserCoupon>()
            .await()
    }

    override suspend fun payAuthWechat(
        user_id: String,
        login_token: String,
        order_id: String
    ): WxPayAuthBean {
        return RxHttp.postForm("$baseUrl/api/Order/payAuth")
            .add("user_id", user_id)
            .add("order_id", order_id)
            .add("login_token", login_token)
            .toClass<WxPayAuthBean>()
            .await()
    }


    override suspend fun payBalance(
        user_id: String,
        login_token: String,
        order_id: String
    ): BalancePayAuthBean {
        TODO("Not yet implemented")
    }

    override suspend fun getUserOrderLiveList(
        user_id: String,
        login_token: String,
        page: Int,
        order_type: OrderState
    ): OrderList {
        return RxHttp.postForm("$baseUrl/api/Order/getUserOrderList")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("page", page)
            .add("order_type", order_type.value)
            .toClass<OrderList>()
            .await()
    }

    override suspend fun getUserOrderList(
        user_id: String,
        login_token: String,
        page: Int,
        order_type: OrderState
    ): OrderList {
        return RxHttp.postForm("$baseUrl/api/Order/getUserOrderList")
            .add("user_id", user_id)
            .add("login_token", login_token)
            .add("page", page)
            .add("order_type", order_type.value)
            .toClass<OrderList>()
            .await()
    }

    override suspend fun getCollectList(
        user_id: String,
        login_token: String,
        page: Int
    ): CollectListBean {
        TODO("Not yet implemented")
    }

    override suspend fun deleteCollect(
        user_id: String,
        login_token: String,
        collect_id: String
    ): BaseResponse {
        TODO("Not yet implemented")
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
        TODO("Not yet implemented")
    }


    override suspend fun loadScanInfo(url: String): ScanInfoBean {
        TODO("Not yet implemented")
    }

    override suspend fun orderDetails(
        order_id: String,
        user_id: String,
        login_token: String
    ): OrderDetailsBean {
        TODO("Not yet implemented")
    }

    override suspend fun getWriteOffList(
        user_id: String,
        login_token: String,
        page: Int
    ): WriteOffBean {
        TODO("Not yet implemented")
    }

    override suspend fun getShopBalance(user_id: String, login_token: String): ShopBalance {
        TODO("Not yet implemented")
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
        TODO("Not yet implemented")
    }

    override suspend fun writeOff(order_id: String, user_id: String, token: String): ShopBalance {
        TODO("Not yet implemented")
    }

    override suspend fun destroyUser(user_id: String, token: String): BaseResponse {
        TODO("Not yet implemented")
    }

    override suspend fun express(
        order_id: String,
        order_goods_id: String,
        user_id: String,
        login_token: String
    ): ExpressBean {
        TODO("Not yet implemented")
    }

    override suspend fun bankList(user_id: String): BankListBean {
        TODO("Not yet implemented")
    }

    override suspend fun addBankCard(
        user_id: String,
        bank_name: String,
        bank_card: String,
        bank_account: String,
        holder: String,
        telephone: String
    ): BaseResponse {
        TODO("Not yet implemented")
    }

    override suspend fun deleteBankCard(user_id: String, bankcard: String): BaseResponse {
        TODO("Not yet implemented")
    }

    override suspend fun withdrawList(user_id: String, page: Int): WithdrawBean {
        TODO("Not yet implemented")
    }

    override suspend fun applyWithdraw(
        user_id: String,
        bankcard_id: String,
        money: String,
        pay_type: String
    ): BaseResponse {
        TODO("Not yet implemented")
    }

    override suspend fun homeActive(type: Int): ActiveBean {
        TODO("Not yet implemented")
    }
}

enum class PayType(val value: String, val payName: String) {
    WeChat("20", "微信支付"),
    AliPay("-1", "支付宝支付"),
    Self("10", "途乐币支付"),
    Other("undefined", "其他支付");

    companion object {
        fun decode(payTypeCode: Int): PayType {
            return when (payTypeCode) {
                1 -> WeChat
                2 -> AliPay
                3 -> Self
                else -> Other
            }
        }

        fun fromString(text: String): PayType {
            return when (text) {
                "10" -> Self
                "20" -> WeChat
                "-1" -> AliPay
                else -> Other
            }
        }
    }
}

enum class GoodsType(val value: String) {
    Self("1"),
    Live("2");

    companion object {
        fun values(value: String): GoodsType {
            if (value == "1") return Self
            else return Live
        }
    }


}

enum class PayFrom(val value: String) {
    GoodsDetails("1"),
    Cart("2")
}

enum class EvaluationType(val value: String) {
    All("all"), Picture("picture"), Praise("praise"), Review("review"), Negative("negative"), Unknown(
        ""
    );

    companion object {
        fun valueOf(type: Int): EvaluationType {
            return when (type) {
                0 -> All
                1 -> Picture
                2 -> Praise
                3 -> Review
                4 -> Negative
                else -> Unknown
            }
        }
    }
}


enum class OrderState(val value: String, val code: String) {
    //    1：待支付 2：代发货 3：待收货 4：待评价 5：售后中 6：全部订单
    WillPay("payment", "10"),
    WillSend("delivered", "20"),
    WillReceive("received", "30"),
    WillEvaluation("comment", "40"),
    TimeOut("expire", "40"),
    AfterSale("", ""),
    AllOrder("all", ""),
    Unknown("", "");

    companion object {
        fun valueOf(value: String) = when (value) {
            "1" -> WillPay
            "2" -> WillSend
            "3" -> WillReceive
            "4" -> WillEvaluation
            "5" -> AfterSale
            "6" -> AllOrder
            else -> Unknown
        }

        fun valueOf(value: Int) = when (value) {
            1 -> WillPay
            2 -> WillSend
            3 -> WillReceive
            4 -> WillEvaluation
            5 -> AfterSale
            0 -> AllOrder
            else -> Unknown
        }

        fun fromLive(value: Int) = when (value) {
            0 -> WillPay
            1 -> WillSend
            2 -> WillReceive
            3 -> TimeOut
            else -> Unknown
        }

        fun fromCode(code: String): OrderState {

            return when (code) {
                "10" -> WillPay
                "20" -> WillSend
                "30" -> WillReceive
                "40" -> WillEvaluation
                else -> Unknown
            }
        }
    }
}

