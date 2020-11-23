package com.ds.worldfunclub.responsebean;

import android.os.Parcel;
import android.os.Parcelable;

import com.ds.worldfunclub.base.ExtensionsKt;

public class GoodsArr implements Parcelable {
    private String goods_id;
    private String sku_id;
    private String buy_num;
    private String count_price;
    private String remark;
    private String discount_id;
    private String img;
    private String goodsName;
    private String skuName;
    private String price;
    private String cartId;

    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getSkuName() {
        return skuName;
    }

    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    protected GoodsArr(Parcel in) {
        goods_id = in.readString();
        sku_id = in.readString();
        buy_num = in.readString();
        count_price = in.readString();
        remark = in.readString();
        discount_id = in.readString();
        goodsName = in.readString();
        skuName = in.readString();
        img = in.readString();
        price = in.readString();
        cartId=in.readString();
    }


    public GoodsArr() {
    }

    public static GoodsArr createBy(GoodsDetailsResp.DataBean details, String skuName, String skuPrice, String sku_id, String skuImage, int count) {
        GoodsArr resp = new GoodsArr();
        resp.buy_num = count + "";
        resp.count_price = ExtensionsKt.toYuan(ExtensionsKt.stringToDouble(skuPrice) * count);
        if (details.getDiscount().size() > 0) {
            resp.discount_id = details.getDiscount().get(0).getDiscount_id();
        }
        resp.goods_id=details.getGoods_id();
        resp.sku_id = sku_id;
        resp.goodsName = details.getGoods_name();
        resp.skuName = skuName;
        resp.img = skuImage;
        resp.price = skuPrice;
        return resp;
    }

    public static GoodsArr createBy(GoodsDetailsResp2.DataBean details, String skuName, String skuPrice, String sku_id, String skuImage, int count) {
        GoodsArr resp = new GoodsArr();
        resp.buy_num = count + "";
        resp.count_price = ExtensionsKt.toYuan(ExtensionsKt.stringToDouble(skuPrice) * count);
//        if (details.getDiscount().size() > 0) {
//            resp.discount_id = details.getDiscount().get(0).getDiscount_id();
//        }
        resp.goods_id=details.getGoods_id();
        resp.sku_id = sku_id;
        resp.goodsName = details.getGoods_name();
        resp.skuName = skuName;
        resp.img = skuImage;
        resp.price = skuPrice;
        return resp;
    }

    public static GoodsArr createBy(CartData.DataBean details ) {
        GoodsArr resp = new GoodsArr();
        resp.buy_num = details.getNum()  ;
        resp.count_price = ExtensionsKt.toYuan(ExtensionsKt.stringToDouble(details.getPrice()) * ExtensionsKt.stringToDouble(details.getNum()));
//        if (details.getDiscount().size() > 0) {
//            resp.discount_id = details.getDiscount().get(0).getDiscount_id();
//        }
        resp.goods_id=details.getGoods_id();
        resp.sku_id = details.getSku_id();
        resp.goodsName = details.getGoods_name();
        resp.skuName = details.getSku_name();
        resp.img = details.getSku_image();
        resp.price = ExtensionsKt.toYuan(ExtensionsKt.stringToDouble(details.getPrice()));
        return resp;
    }

    public static GoodsArr createBy(CartData2.DataBean.GoodsListBean details ) {
        GoodsArr resp = new GoodsArr();
        resp.buy_num = details.getTotal_num()  ;
        resp.count_price = ExtensionsKt.toYuan(ExtensionsKt.stringToDouble(details.getGoods_price()) * ExtensionsKt.stringToDouble(details.getTotal_num()));
//        if (details.getDiscount().size() > 0) {
//            resp.discount_id = details.getDiscount().get(0).getDiscount_id();
//        }
        resp.cartId=details.getCart_id();
        resp.goods_id=details.getGoods_id();
        resp.sku_id = details.getGoods_sku_id();
        resp.goodsName = details.getGoods_name();
        resp.skuName = details.getGoods_attr();
        resp.img = details.getGoods_image();
        resp.price = ExtensionsKt.toYuan(ExtensionsKt.stringToDouble(details.getGoods_price()));
        return resp;
    }

    public static final Creator<GoodsArr> CREATOR = new Creator<GoodsArr>() {
        @Override
        public GoodsArr createFromParcel(Parcel in) {
            return new GoodsArr(in);
        }

        @Override
        public GoodsArr[] newArray(int size) {
            return new GoodsArr[size];
        }
    };

    public String getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(String goods_id) {
        this.goods_id = goods_id;
    }

    public String getSku_id() {
        return sku_id;
    }

    public void setSku_id(String sku_id) {
        this.sku_id = sku_id;
    }

    public String getBuy_num() {
        return buy_num;
    }

    public void setBuy_num(String buy_num) {
        this.buy_num = buy_num;
    }

    public String getCount_price() {
        return count_price;
    }

    public void setCount_price(String count_price) {
        this.count_price = count_price;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getDiscount_id() {
        return discount_id;
    }

    public void setDiscount_id(String discount_id) {
        this.discount_id = discount_id;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(goods_id);
        parcel.writeString(sku_id);
        parcel.writeString(buy_num);
        parcel.writeString(count_price);
        parcel.writeString(remark);
        parcel.writeString(discount_id);
        parcel.writeString(goodsName);
        parcel.writeString(skuName);
        parcel.writeString(img);
        parcel.writeString(price);
        parcel.writeString(cartId);
    }
}
