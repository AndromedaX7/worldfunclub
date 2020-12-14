package com.ds.worldfunclub.network

import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.responsebean.*
import java.io.File


interface Api {
    suspend fun userBindMobile(
        userId: String,
        phone: String,
        token: String,
        code: String
    ): BaseResponse


    suspend fun goodsDetails(
        user_id: String,
        login_token: String,
        id: String,
        discount_id: String
    ): GoodsDetailsResp2


    suspend fun goodsDetails(id: String, discount_id: String): GoodsDetailsResp2

    suspend fun collect(
        userId: String,
        token: String,
        goods_id: String,
        collect: Boolean
    ): BaseResponse


    //http://shop.tule-live.com/index.php/api/Comment/getCommentlists

    suspend fun addCommentThumbs(app: App, evaluate_id: String, type: String): BaseResponse

    //    /api/goods/getGoodsSkuInfo

    //api/Coupon/receiveCoupon

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

    ///api/GoodsCart/increaseCartNum

    suspend fun increaseCartNum2(
        type: String,
        cart_id: String,
        user_id: String,
        login_token: String
    ): BaseResponse
//    http://tule-live.com/index.php/api/Address/getDefaultAddress





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



    suspend fun loadEvaluationList(
            user_id: String, login_token: String, page: Int,
            type: EvaluationType, goods_id: String
    ): CommentData
    //    http://tule-live.com/index.php/api/Coupon/getUserCoupon
    //    http://tule-live.com/index.php/api/Order/payAuth


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


//    goods_id       :    String,    商品id
//    goods_num       :    String,    购买数量
//    goods_sku_id   :    String,    商品sku_id
//    pay_type       :    String,    支付方式 10 余额 20微信
//    goods_money       :    String,    商品总金额
//    name           :    String,    购买人姓名
//    phone           :    String,    购买人手机号码
//    subscribe_date:     String,    预约的时间 预约产品必填
//    remark           :    String,    备注


    suspend fun orderDetails(
        order_id: String,
        user_id: String,
        login_token: String
    ): OrderDetailsBean


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




    suspend fun destroyUser(user_id: String, token: String): BaseResponse


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

