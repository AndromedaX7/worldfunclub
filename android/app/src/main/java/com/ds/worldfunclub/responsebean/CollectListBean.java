package com.ds.worldfunclub.responsebean;

import java.util.List;

public class CollectListBean extends  BaseResponse{

    /**
     * collect_id : 8
     * user_id : 10015
     * goods_id : 10037
     * goods_name : 苹果Xone
     * goods_price : 12.00
     * goods_sales : 1000
     * goods_image : http://storage.tule-live.com/20201016191749d186d0949.jpg
     */

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        private String collect_id;
        private String user_id;
        private String goods_id;
        private String goods_name;
        private String goods_price;
        private String goods_sales;
        private String goods_image;

        public String getCollect_id() {
            return collect_id;
        }

        public void setCollect_id(String collect_id) {
            this.collect_id = collect_id;
        }

        public String getUser_id() {
            return user_id;
        }

        public void setUser_id(String user_id) {
            this.user_id = user_id;
        }

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

        public String getGoods_price() {
            return goods_price;
        }

        public void setGoods_price(String goods_price) {
            this.goods_price = goods_price;
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
