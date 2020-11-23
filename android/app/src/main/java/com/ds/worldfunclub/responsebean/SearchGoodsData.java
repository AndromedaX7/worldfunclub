package com.ds.worldfunclub.responsebean;

import java.util.List;

public class SearchGoodsData extends  BaseResponse {
    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * goods_id : 9
         * introduction : 123
         * market_price : 123.00
         * price : 10.00
         * sale_num : 50
         * gc_id : 6
         * goods_name : 123
         * goods_image : http://tule-live.com/upload/1/common/images/20200820/20200820091237159788595752767.png
         * goods_stock : 123
         * virtual_sale : 0
         */

        private String goods_id;
        private String introduction;
        private String market_price;
        private String price;
        private String sale_num;
        private String gc_id;
        private String goods_name;
        private String goods_image;
        private String goods_stock;
        private String virtual_sale;

        public String getGoods_id() {
            return goods_id;
        }

        public void setGoods_id(String goods_id) {
            this.goods_id = goods_id;
        }

        public String getIntroduction() {
            return introduction;
        }

        public void setIntroduction(String introduction) {
            this.introduction = introduction;
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

        public String getSale_num() {
            return sale_num;
        }

        public void setSale_num(String sale_num) {
            this.sale_num = sale_num;
        }

        public String getGc_id() {
            return gc_id;
        }

        public void setGc_id(String gc_id) {
            this.gc_id = gc_id;
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

        public String getGoods_stock() {
            return goods_stock;
        }

        public void setGoods_stock(String goods_stock) {
            this.goods_stock = goods_stock;
        }

        public String getVirtual_sale() {
            return virtual_sale;
        }

        public void setVirtual_sale(String virtual_sale) {
            this.virtual_sale = virtual_sale;
        }
    }
}
