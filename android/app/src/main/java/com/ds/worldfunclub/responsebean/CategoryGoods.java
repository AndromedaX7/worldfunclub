package com.ds.worldfunclub.responsebean;

import java.util.List;

public class CategoryGoods extends BaseResponse {
    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * goods_id : 11
         * introduction : 运费
         * market_price : 123.00
         * price : 123.00
         * sale_num : 0
         * sku_id : 17
         * goods_name : 运费
         * goods_image : http://tule-live.com/upload/1/common/images/20200820/20200820091237159788595752767.png
         * goods_stock : 123
         */


        private String goods_id;
        private String goods_name;
        private String spec_type;
        private String shop_id;
        private String is_shop;
        private String category_id;
        private String goods_type;
        private String goods_sku_id;
        private String goods_price;
        private String line_price;
        private String stock_num;
        private String goods_sales;
        private String goods_image;
//        private String goods_id;
//        private String introduction;
//        private String market_price;
//        private String price;
//        private String sale_num;
//        private String sku_id;
//        private String goods_name;
//        private String goods_image;
//        private String goods_stock;


        public String getGoods_id() {
            return goods_id;
        }

        public void setGoods_id(String goods_id) {
            this.goods_id = goods_id;
        }

        public String getGoods_name() {
            return goods_name;
        }

        public void setGoods_name(String goods_name) {
            this.goods_name = goods_name;
        }

        public String getSpec_type() {
            return spec_type;
        }

        public void setSpec_type(String spec_type) {
            this.spec_type = spec_type;
        }

        public String getShop_id() {
            return shop_id;
        }

        public void setShop_id(String shop_id) {
            this.shop_id = shop_id;
        }

        public String getIs_shop() {
            return is_shop;
        }

        public void setIs_shop(String is_shop) {
            this.is_shop = is_shop;
        }

        public String getCategory_id() {
            return category_id;
        }

        public void setCategory_id(String category_id) {
            this.category_id = category_id;
        }

        public String getGoods_type() {
            return goods_type;
        }

        public void setGoods_type(String goods_type) {
            this.goods_type = goods_type;
        }

        public String getGoods_sku_id() {
            return goods_sku_id;
        }

        public void setGoods_sku_id(String goods_sku_id) {
            this.goods_sku_id = goods_sku_id;
        }

        public String getGoods_price() {
            return goods_price;
        }

        public void setGoods_price(String goods_price) {
            this.goods_price = goods_price;
        }

        public String getLine_price() {
            return line_price;
        }

        public void setLine_price(String line_price) {
            this.line_price = line_price;
        }

        public String getStock_num() {
            return stock_num;
        }

        public void setStock_num(String stock_num) {
            this.stock_num = stock_num;
        }

        public String getGoods_sales() {
            return goods_sales;
        }

        public void setGoods_sales(String goods_sales) {
            this.goods_sales = goods_sales;
        }

        public String getGoods_image() {
            return goods_image;
        }

        public void setGoods_image(String goods_image) {
            this.goods_image = goods_image;
        }
    }
}
