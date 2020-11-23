package com.ds.worldfunclub.responsebean;

import android.text.TextUtils;

public class GoodsArr2 {

    //goods_id	是	string	商品id
//goods_num	是	string	购买数量
//goods_sku_id	是	string	商品sku_id
//remark	否	string	备注
    private String goods_id;
    private String buy_num;
    private String sku_id;
    private String count_price;
    private String remark = "";
    private String discount_id;
    private String cartId;

    public GoodsArr2() {
    }

    public static GoodsArr2 from(GoodsArr src) {
        GoodsArr2 resp = new GoodsArr2();
        resp.goods_id = src.getGoods_id();
        resp.sku_id = src.getSku_id();
        resp.buy_num = src.getBuy_num();
        resp.count_price = src.getCount_price();
        resp.discount_id = src.getDiscount_id();
        resp.cartId = src.getCartId();
        if (TextUtils.isEmpty(resp.discount_id)) {
            resp.discount_id = "";
        }
        if (TextUtils.isEmpty(src.getRemark()))
            resp.remark = "";
        else {
            resp.remark = src.getRemark();
        }
        return resp;
    }


    public String getCartId() {
        return cartId;
    }

    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

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

}
