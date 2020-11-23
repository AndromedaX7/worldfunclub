package com.ds.worldfunclub.responsebean

import android.os.Parcel
import android.os.Parcelable

class LiveBuy() : Parcelable {
    var goods_id = ""
    var skuId: String = ""
    var goodsPrice: String = ""
    var subscribeDate = ""
    var needSubScribeDate = false
    var goods_image = ""
    var goods_attr = ""
    var goods_name = ""
    var stock_num = ""

    constructor(parcel: Parcel) : this() {
        goods_id = parcel.readString() ?: ""
        skuId = parcel.readString() ?: ""
        goodsPrice = parcel.readString() ?: ""
        subscribeDate = parcel.readString() ?: ""
        needSubScribeDate = parcel.readByte() != 0.toByte()
        goods_image = parcel.readString() ?: ""
        goods_attr = parcel.readString() ?: ""
        goods_name = parcel.readString() ?: ""
        stock_num = parcel.readString() ?: ""
    }

    override fun writeToParcel(parcel: Parcel, flags: Int) {
        parcel.writeString(goods_id)
        parcel.writeString(skuId)
        parcel.writeString(goodsPrice)
        parcel.writeString(subscribeDate)
        parcel.writeByte(if (needSubScribeDate) 1 else 0)
        parcel.writeString(goods_image)
        parcel.writeString(goods_attr)
        parcel.writeString(goods_name)
        parcel.writeString(stock_num)
    }

    override fun describeContents(): Int {
        return 0
    }

    companion object CREATOR : Parcelable.Creator<LiveBuy> {
        override fun createFromParcel(parcel: Parcel): LiveBuy {
            return LiveBuy(parcel)
        }

        override fun newArray(size: Int): Array<LiveBuy?> {
            return arrayOfNulls(size)
        }

        fun from(data: DelicacyGoodsInfo): LiveBuy {
            val liveBuy = LiveBuy()
            liveBuy.goods_id = data.goods_id
            liveBuy.skuId = data.goods_sku_id
            liveBuy.goodsPrice = data.goods_price
            liveBuy.subscribeDate = ""
            liveBuy.needSubScribeDate = data.needSubScribe
            liveBuy.goods_image = data.image
            liveBuy.goods_attr = data.spec_value
            liveBuy.goods_name = data.group_name
            liveBuy.stock_num = data.stock_num
            return liveBuy
        }
    }

}