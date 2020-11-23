package com.ds.worldfunclub.responsebean;

import android.text.TextUtils;

import com.ds.worldfunclub.base.ExtensionsKt;

import java.util.List;

public class CartData extends BaseResponse {


    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * cart_id : 63
         * user_center_id : 3
         * goods_id : 13
         * sku_id : 22
         * num : 5
         * price : 123
         * sku_image : http://tule-live.com/upload/1/common/images/20200826/20200826093536159840573672946.jpg
         * sku_name : 王世涛 黑色 16G
         * goods_name : 王世涛
         * goods_state : 1
         * stock : 5
         * is_discount : 0
         * discount_status :
         * start_time :
         * end_time :
         */
        private boolean enabled;
        private boolean selected;
        private String cart_id;
        private String user_center_id;
        private String goods_id;
        private String sku_id;
        private String num;
        private String price;
        private String sku_image;
        private String sku_name;
        private String goods_name;
        private String goods_state;
        private String stock;
        private String is_discount;
        private String discount_status;
        private String start_time;
        private String end_time;

        public boolean isEnabled() {
            return TextUtils.isEmpty(this.start_time)|| ExtensionsKt.stringToLong(this.start_time)*1000<System.currentTimeMillis();
        }

        public void setEnabled(boolean enabled) {
            this.enabled = enabled;
        }

        public boolean isSelected() {
            return selected;
        }

        public void setSelected(boolean selected) {
            this.selected = selected;
        }

        public String getCart_id() {
            return cart_id;
        }

        public void setCart_id(String cart_id) {
            this.cart_id = cart_id;
        }

        public String getUser_center_id() {
            return user_center_id;
        }

        public void setUser_center_id(String user_center_id) {
            this.user_center_id = user_center_id;
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

        public String getNum() {
            return num;
        }

        public void setNum(String num) {
            this.num = num;
        }

        public String getPrice() {
            return price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

        public String getSku_image() {
            return sku_image;
        }

        public void setSku_image(String sku_image) {
            this.sku_image = sku_image;
        }

        public String getSku_name() {
            return sku_name;
        }

        public void setSku_name(String sku_name) {
            this.sku_name = sku_name;
        }

        public String getGoods_name() {
            return goods_name;
        }

        public void setGoods_name(String goods_name) {
            this.goods_name = goods_name;
        }

        public String getGoods_state() {
            return goods_state;
        }

        public void setGoods_state(String goods_state) {
            this.goods_state = goods_state;
        }

        public String getStock() {
            return stock;
        }

        public void setStock(String stock) {
            this.stock = stock;
        }

        public String getIs_discount() {
            return is_discount;
        }

        public void setIs_discount(String is_discount) {
            this.is_discount = is_discount;
        }

        public String getDiscount_status() {
            return discount_status;
        }

        public void setDiscount_status(String discount_status) {
            this.discount_status = discount_status;
        }

        public String getStart_time() {
            return start_time;
        }

        public void setStart_time(String start_time) {
            this.start_time = start_time;
        }

        public String getEnd_time() {
            return end_time;
        }

        public void setEnd_time(String end_time) {
            this.end_time = end_time;
        }
    }
}
