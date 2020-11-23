package com.ds.worldfunclub.network

import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.responsebean.ActiveBean
import com.ds.worldfunclub.responsebean.*
import java.io.File


interface Api {
    suspend fun uploadWechatAuthCode(code: String): LoginInfo
    suspend fun smsCodeBindPhoneAccount(userId: String, phone: String, token: String): SendSMSCode
    suspend fun smsCodeLogin(phone: String): SendSMSCode
    suspend fun login(mobileLogin: String, code: String): LoginInfo
    suspend fun userBindMobile(
        userId: String,
        phone: String,
        token: String,
        code: String
    ): BaseResponse

    suspend fun homeCategory(): HomeCategory?
    suspend fun splashImage(): SplashImageData
    suspend fun searchGoods(key_word: String, page: Int, type: Int): SearchGoodsData
    suspend fun searchGoodsWithPrice(key_word: String, page: Int, sort: Int): SearchGoodsData
    suspend fun banner(category_id: String, rotation_type: String): BannerData
//    suspend fun categoryGoods(
//        category_id: String,
//        level: String,
//        choice: Boolean,
//        page: Int
//    ): CategoryGoods

    suspend fun categoryGoods(
        category_id: String,
        self: Boolean,
        choice: String,
        page: Int
    ): CategoryGoods

    suspend fun getDiscountList(): DiscountList

    suspend fun getDiscountGoods(id: String): DiscountGoods

    suspend fun goodsDetails(
        user_id: String,
        login_token: String,
        id: String,
        discount_id: String
    ): GoodsDetailsResp2

    suspend fun goodsDetailsLive(
        user_id: String,
        login_token: String,
        id: String,
        discount_id: String
    ): GoodsDetailsResp3

    suspend fun goodsDetails(id: String, discount_id: String): GoodsDetailsResp2

    suspend fun collect(
        userId: String,
        token: String,
        goods_id: String,
        collect: Boolean
    ): BaseResponse

    suspend fun getGoodsCoupon(
        user_id: String,
        login_token: String,
        goods_id: String
    ): GoodsCouponData

    //http://shop.tule-live.com/index.php/api/Comment/getCommentlists
    suspend fun loadEvaluationList(
        user_id: String,
        login_token: String,
        page: Int,
        type: EvaluationType,
        goods_id: String
    ): CommentData

    suspend fun addCommentThumbs(app: App, evaluate_id: String, type: String): BaseResponse

    //    /api/goods/getGoodsSkuInfo
    suspend fun goodsSKU(
        user_id: String,
        login_token: String,
        goods_id: String,
        sku_str: String
    ): SkuData

    suspend fun goodsSKU(goods_id: String, sku_str: String): SkuData

    //api/Coupon/receiveCoupon
    suspend fun receiveCoupon(
        coupon_type_id: String,
        user_id: String,
        login_token: String
    ): BaseResponse

    suspend fun addCart(
        goods_id: String,
        sku_id: String,
        num: Int,
        user_id: String,
        login_token: String
    ): BaseResponse

    suspend fun addCart(
        goods_id: String,
        sku_id: String,
        num: Int,
        discount_id: String,
        user_id: String,
        login_token: String
    ): BaseResponse

    //    /api/GoodsCart/getCartList
    suspend fun getCartList(page: Int, user_id: String, login_token: String): CartData2
    suspend fun getCartList(user_id: String, login_token: String): CartData2

    ///api/GoodsCart/increaseCartNum
    suspend fun increaseCartNum(
        num: String,
        cart_id: String,
        user_id: String,
        login_token: String
    ): BaseResponse

    suspend fun increaseCartNum2(
        type: String,
        cart_id: String,
        user_id: String,
        login_token: String
    ): BaseResponse
//    http://tule-live.com/index.php/api/Address/getDefaultAddress

    suspend fun getDefaultAddress(user_id: String, login_token: String): DefaultAddress

    suspend fun userAddressList(user_id: String, login_token: String): AddressData

    //    /api/Address/addAddress
    suspend fun addAddress(
        user_id: String,
        login_token: String,
        region: String,
        name: String,
        phone: String,
        detail: String,
        is_default: Boolean
    ): BaseResponse

    suspend fun editAddress(
        address_id: String,
        user_id: String,
        login_token: String,
        region: String,
        name: String,
        phone: String,
        detail: String,
        is_default: Boolean
    ): BaseResponse

//    /api/Address/delAddress

    suspend fun delAddress(user_id: String, login_token: String, id: String): BaseResponse

    //    http://tule-live.com/index.php/api/GoodsCart/delCart
    suspend fun delCart(
        user_id: String,
        login_token: String,
        cart_ids: List<String>
    ): BaseResponse


    suspend fun buyNow(
        user_id: String,
        login_token: String,
        goods_money: String,
        goods_type: GoodsType,
        address_id: String,
        pay_type: PayType,
        goods_attr: GoodsArr2
    ): CreateOrderResp

    suspend fun buyCart(
        user_id: String,
        login_token: String,
        goods_money: String,
        goods_type: GoodsType,
        address_id: String,
        pay_type: PayType,
        goods_attr: List<GoodsArr2>
    ): CreateOrderResp


    //    http://tule-live.com/index.php/api/Order/createOrder
    suspend fun createOrder(
        user_id: String,
        login_token: String,
        goods_money: String,
        self: GoodsType,
        address_id: String,
        pay_type: PayType,
        pay_from: PayFrom,
        goods_arr: List<GoodsArr2>
    ): CreateOrderResp


    //    http://tule-live.com/index.php/api/Coupon/getUserCoupon
    suspend fun getUserCoupon(
        user_id: String,
        login_token: String,
        goods_money: String
    ): UserCoupon

    //    http://tule-live.com/index.php/api/Order/payAuth
    suspend fun payAuthWechat(
        user_id: String,
        login_token: String,
        order_id: String
    ): WxPayAuthBean

    suspend fun payBalance(
        user_id: String,
        login_token: String,
        order_id: String
    ): BalancePayAuthBean

    //    http://tule-live.com/index.php/api/Order/getUserOrderList
//    user_id
//    login_token
//    page
//    order_type
    suspend fun getUserOrderList(
        user_id: String,
        login_token: String,
        page: Int,
        order_type: OrderState
    ): OrderList

    suspend fun getUserOrderLiveList(
        user_id: String,
        login_token: String,
        page: Int,
        order_type: OrderState
    ): OrderList

    suspend fun getCollectList(user_id: String, login_token: String, page: Int): CollectListBean
    suspend fun deleteCollect(
        user_id: String,
        login_token: String,
        collect_id: String
    ): BaseResponse


    suspend fun loadScanInfo(url: String): ScanInfoBean

//    goods_id       :    String,    商品id
//    goods_num       :    String,    购买数量
//    goods_sku_id   :    String,    商品sku_id
//    pay_type       :    String,    支付方式 10 余额 20微信
//    goods_money       :    String,    商品总金额
//    name           :    String,    购买人姓名
//    phone           :    String,    购买人手机号码
//    subscribe_date:     String,    预约的时间 预约产品必填
//    remark           :    String,    备注

    suspend fun liveBuyNow(
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
    ): CreateOrderResp

    suspend fun orderDetails(
        order_id: String,
        user_id: String,
        login_token: String
    ): OrderDetailsBean

    suspend fun getShopBalance(user_id: String, login_token: String): ShopBalance

    //
    suspend fun getWriteOffList(user_id: String, login_token: String, page: Int): WriteOffBean

    //    /api/user.comment/saveComment
    suspend fun saveComment(
        user_id: String,
        login_token: String,
        order_id: String,
        goods_id: String,
        star: Int,
        content: String,
        is_anonymous: String,
        files: List<File>
    ): BaseResponse


    suspend fun writeOff(order_id: String, user_id: String, token: String): ShopBalance


    suspend fun destroyUser(user_id: String, token: String): BaseResponse

    suspend fun express(
        order_id: String,
        order_goods_id: String,
        user_id: String,
        login_token: String
    ): ExpressBean

    suspend fun bankList(user_id: String): BankListBean

    //    bank_name	是	string	银行卡所在银行
//    bank_card	是	string	银行卡号
//    bank_account	是	string	银行开户行
//    holder	是	string	持卡人姓名
//    telephone	是	string	持卡人手机号
    suspend fun addBankCard(
        user_id: String,
        bank_name: String,
        bank_card: String,
        bank_account: String,
        holder: String,
        telephone: String
    ): BaseResponse

    suspend fun deleteBankCard(user_id: String, bankcard: String): BaseResponse
    suspend fun applyWithdraw(user_id: String,bankcard_id:String ,money:String,pay_type:String):BaseResponse
    suspend fun withdrawList(user_id: String,page: Int):WithdrawBean
    suspend fun homeActive(type: Int): ActiveBean
}

