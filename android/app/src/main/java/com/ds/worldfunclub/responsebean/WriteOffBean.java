package com.ds.worldfunclub.responsebean;

import java.util.List;

public class WriteOffBean extends BaseResponse {
    /**
     * order_id : 273
     * order_no : 2020102799519897
     * total_price : 255.00
     * shop_name : 火锅门店
     * state_text : 待付款
     * lh_order_status : 10
     * lh_start_time : 2020-10-01 00:00:00
     * lh_end_time : 2021-01-31 00:00:00
     * goods : [{"order_goods_id":"259","goods_id":"10042","goods_name":"乐活单规格不需预约","goods_price":"255.00","total_num":"1","image":"http://file.mos.ink/20201014105901fef4f7680.png","goods_attr":""}]
     */

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        private String order_id;
        private String order_no;
        private String total_price;
        private String shop_name;
        private String state_text;
        private String lh_order_status;
        private String lh_start_time;
        private String lh_end_time;
        /**
         * order_goods_id : 259
         * goods_id : 10042
         * goods_name : 乐活单规格不需预约
         * goods_price : 255.00
         * total_num : 1
         * image : http://file.mos.ink/20201014105901fef4f7680.png
         * goods_attr :
         */

        private List<GoodsBean> goods;

        public String getOrder_id() {
            return order_id;
        }

        public void setOrder_id(String order_id) {
            this.order_id = order_id;
        }

        public String getOrder_no() {
            return order_no;
        }

        public void setOrder_no(String order_no) {
            this.order_no = order_no;
        }

        public String getTotal_price() {
            return total_price;
        }

        public void setTotal_price(String total_price) {
            this.total_price = total_price;
        }

        public String getShop_name() {
            return shop_name;
        }

        public void setShop_name(String shop_name) {
            this.shop_name = shop_name;
        }

        public String getState_text() {
            return state_text;
        }

        public void setState_text(String state_text) {
            this.state_text = state_text;
        }

        public String getLh_order_status() {
            return lh_order_status;
        }

        public void setLh_order_status(String lh_order_status) {
            this.lh_order_status = lh_order_status;
        }

        public String getLh_start_time() {
            return lh_start_time;
        }

        public void setLh_start_time(String lh_start_time) {
            this.lh_start_time = lh_start_time;
        }

        public String getLh_end_time() {
            return lh_end_time;
        }

        public void setLh_end_time(String lh_end_time) {
            this.lh_end_time = lh_end_time;
        }

        public List<GoodsBean> getGoods() {
            return goods;
        }

        public void setGoods(List<GoodsBean> goods) {
            this.goods = goods;
        }

        private  String goodsName;

        public String getGoodsName() {
            if(goods.size()>0){
                return  goods.get(0).goods_name;
            }else
            return "" ;
        }

        public void setGoodsName(String goodsName) {
            this.goodsName = goodsName;
        }

        public static class GoodsBean {
            private String order_goods_id;
            private String goods_id;
            private String goods_name;
            private String goods_price;
            private String total_num;
            private String image;
            private String goods_attr;

            public String getOrder_goods_id() {
                return order_goods_id;
            }

            public void setOrder_goods_id(String order_goods_id) {
                this.order_goods_id = order_goods_id;
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

            public String getTotal_num() {
                return total_num;
            }

            public void setTotal_num(String total_num) {
                this.total_num = total_num;
            }

            public String getImage() {
                return image;
            }

            public void setImage(String image) {
                this.image = image;
            }

            public String getGoods_attr() {
                return goods_attr;
            }

            public void setGoods_attr(String goods_attr) {
                this.goods_attr = goods_attr;
            }
        }
    }
}
