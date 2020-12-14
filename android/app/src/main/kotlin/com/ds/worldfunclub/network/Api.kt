package com.ds.worldfunclub.network

import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.responsebean.*
import java.io.File


interface Api {
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


    suspend fun buyNow(
        user_id: String,
        login_token: String,
        goods_money: String,
        goods_type: GoodsType,
        address_id: String,
        pay_type: PayType,
        goods_attr: GoodsArr2
    ): CreateOrderResp


    suspend fun loadEvaluationList(
            user_id: String, login_token: String, page: Int,
            type: EvaluationType, goods_id: String
    ): CommentData



//    goods_id       :    String,    商品id
//    goods_num       :    String,    购买数量
//    goods_sku_id   :    String,    商品sku_id
//    pay_type       :    String,    支付方式 10 余额 20微信
//    goods_money       :    String,    商品总金额
//    name           :    String,    购买人姓名
//    phone           :    String,    购买人手机号码
//    subscribe_date:     String,    预约的时间 预约产品必填
//    remark           :    String,    备注


    suspend fun destroyUser(user_id: String, token: String): BaseResponse


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
