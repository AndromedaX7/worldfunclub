package com.ds.worldfunclub.responsebean;

import android.util.Log;

import java.util.List;

public class DiscountGoods extends BaseResponse {
    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        private String id;
        private String discount_id;
        private String goods_id;
        private String market_price;
        private String price;
        private String goods_name;
        private String goods_image;
        private String sale_num;
        private String goods_stock;

        public String hasSale() {

            int max;
            int progress;
            try {
                max = Integer.parseInt(goods_stock);
            } catch (NumberFormatException e) {
                max = 1;
            }

            try {
                progress = Integer.parseInt(sale_num);
            } catch (NumberFormatException e) {
                progress = 0;
            }
            return "" + (progress * 100 / max) + "%";

        }

        public String getSale_num() {
            return sale_num;
        }

        public void setSale_num(String sale_num) {
            this.sale_num = sale_num;
        }

        public String getGoods_stock() {
            return goods_stock;
        }

        public void setGoods_stock(String goods_stock) {
            this.goods_stock = goods_stock;
        }

        public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getDiscount_id() {
            return discount_id;
        }

        public void setDiscount_id(String discount_id) {
            this.discount_id = discount_id;
        }

        public String getGoods_id() {
            return goods_id;
        }

        public void setGoods_id(String goods_id) {
            this.goods_id = goods_id;
        }

        public String getMarket_price() {
            return market_price;
        }

        public void setMarket_price(String market_price) {
            this.market_price = market_price;
        }

        public String getPrice() {
            return price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

        public String getGoods_name() {
            return goods_name;
        }

        public void setGoods_name(String goods_name) {
            this.goods_name = goods_name;
        }

        public String getGoods_image() {
            return goods_image;
        }

        public void setGoods_image(String goods_image) {
            this.goods_image = goods_image;
        }
    }
}
