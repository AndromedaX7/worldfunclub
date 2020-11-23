package com.ds.worldfunclub.responsebean;

import java.util.List;

public class SkuData extends BaseResponse {

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * sku_id : 28
         * goods_id : 13
         * sale_num : 0
         * goods_stock : 234
         * price : 234.00
         * market_price : 234.00
         * sku_image : http://tule-live.com/upload/1/common/images/20200824/20200824043812159825829239368.png
         */

        private String sku_id;
        private String goods_id;
        private String sale_num;
        private String goods_stock;
        private String price;
        private String market_price;
        private String sku_image;

        public String getSku_id() {
            return sku_id;
        }

        public void setSku_id(String sku_id) {
            this.sku_id = sku_id;
        }

        public String getGoods_id() {
            return goods_id;
        }

        public void setGoods_id(String goods_id) {
            this.goods_id = goods_id;
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

        public String getPrice() {
            return price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

        public String getMarket_price() {
            return market_price;
        }

        public void setMarket_price(String market_price) {
            this.market_price = market_price;
        }

        public String getSku_image() {
            return sku_image;
        }

        public void setSku_image(String sku_image) {
            this.sku_image = sku_image;
        }
    }
}
