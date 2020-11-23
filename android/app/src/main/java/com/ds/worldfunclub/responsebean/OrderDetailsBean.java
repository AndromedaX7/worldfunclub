package com.ds.worldfunclub.responsebean;

import java.util.List;

public class OrderDetailsBean extends BaseResponse {

    /**
     * order_id : 254
     * order_no : 2020102651525353
     * order_type : 1
     * create_time : 2020-10-26 13:40:42
     * shop_name : 途乐会自营
     * customer_service : ["13601243046","15555555555"]
     * write_off :
     * qrcode :
     * order_status : 10
     * lh_order_status : 10
     * state_text : 待付款
     * name :
     * phone : 0
     * subscribe_date :
     * lh_start_time :
     * lh_end_time :
     * order_address_id : 131
     * address_name : 几点睡的计算机
     * address_phone : 18513121832
     * address_detail : 12
     * address_province : 北京市
     * address_city : 北京市
     * address_region : 西城区
     * shop_id :
     * shop_hours :
     * shop_address :
     * shop_longitude :
     * shop_latitude :
     * shop_logo :
     * shop_province :
     * shop_city :
     * shop_region :
     * goods : [{"order_goods_id":"242","goods_id":"10037","goods_name":"苹果Xone","goods_price":"12.00","total_num":"1","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg","goods_attr":"颜色:金色; 内存:16G; "}]
     */

    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static class DataBean {
        private String order_id;
        private String order_no;
        private String order_type;
        private String create_time;
        private String shop_name;
        private String write_off;
        private String qrcode;
        private String order_status;
        private String lh_order_status;
        private String state_text;
        private String name;
        private String phone;
        private String subscribe_date;
        private String lh_start_time;
        private String lh_end_time;
        private String order_address_id;
        private String address_name;
        private String address_phone;
        private String address_detail;
        private String address_province;
        private String address_city;
        private String address_region;
        private String shop_id;
        private String shop_hours;
        private String shop_address;
        private String shop_longitude;
        private String shop_latitude;
        private String shop_logo;
        private String shop_province;
        private String shop_city;
        private String shop_region;
        private List<String> customer_service;
        private String pay_type;

        public String getPay_type() {
            return pay_type;
        }

        public void setPay_type(String pay_type) {
            this.pay_type = pay_type;
        }

        /**
         * order_goods_id : 242
         * goods_id : 10037
         * goods_name : 苹果Xone
         * goods_price : 12.00
         * total_num : 1
         * image : http://storage.tule-live.com/20201016191749d186d0949.jpg
         * goods_attr : 颜色:金色; 内存:16G;
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

        public String getOrder_type() {
            return order_type;
        }

        public void setOrder_type(String order_type) {
            this.order_type = order_type;
        }

        public String getCreate_time() {
            return create_time;
        }

        public void setCreate_time(String create_time) {
            this.create_time = create_time;
        }

        public String getShop_name() {
            return shop_name;
        }

        public void setShop_name(String shop_name) {
            this.shop_name = shop_name;
        }

        public String getWrite_off() {
            return write_off;
        }

        public void setWrite_off(String write_off) {
            this.write_off = write_off;
        }

        public String getQrcode() {
            return qrcode;
        }

        public void setQrcode(String qrcode) {
            this.qrcode = qrcode;
        }

        public String getOrder_status() {
            return order_status;
        }

        public void setOrder_status(String order_status) {
            this.order_status = order_status;
        }

        public String getLh_order_status() {
            return lh_order_status;
        }

        public void setLh_order_status(String lh_order_status) {
            this.lh_order_status = lh_order_status;
        }

        public String getState_text() {
            return state_text;
        }

        public void setState_text(String state_text) {
            this.state_text = state_text;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getSubscribe_date() {
            return subscribe_date;
        }

        public void setSubscribe_date(String subscribe_date) {
            this.subscribe_date = subscribe_date;
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

        public String getOrder_address_id() {
            return order_address_id;
        }

        public void setOrder_address_id(String order_address_id) {
            this.order_address_id = order_address_id;
        }

        public String getAddress_name() {
            return address_name;
        }

        public void setAddress_name(String address_name) {
            this.address_name = address_name;
        }

        public String getAddress_phone() {
            return address_phone;
        }

        public void setAddress_phone(String address_phone) {
            this.address_phone = address_phone;
        }

        public String getAddress_detail() {
            return address_detail;
        }

        public void setAddress_detail(String address_detail) {
            this.address_detail = address_detail;
        }

        public String getAddress_province() {
            return address_province;
        }

        public void setAddress_province(String address_province) {
            this.address_province = address_province;
        }

        public String getAddress_city() {
            return address_city;
        }

        public void setAddress_city(String address_city) {
            this.address_city = address_city;
        }

        public String getAddress_region() {
            return address_region;
        }

        public void setAddress_region(String address_region) {
            this.address_region = address_region;
        }

        public String getShop_id() {
            return shop_id;
        }

        public void setShop_id(String shop_id) {
            this.shop_id = shop_id;
        }

        public String getShop_hours() {
            return shop_hours;
        }

        public void setShop_hours(String shop_hours) {
            this.shop_hours = shop_hours;
        }

        public String getShop_address() {
            return shop_address;
        }

        public void setShop_address(String shop_address) {
            this.shop_address = shop_address;
        }

        public String getShop_longitude() {
            return shop_longitude;
        }

        public void setShop_longitude(String shop_longitude) {
            this.shop_longitude = shop_longitude;
        }

        public String getShop_latitude() {
            return shop_latitude;
        }

        public void setShop_latitude(String shop_latitude) {
            this.shop_latitude = shop_latitude;
        }

        public String getShop_logo() {
            return shop_logo;
        }

        public void setShop_logo(String shop_logo) {
            this.shop_logo = shop_logo;
        }

        public String getShop_province() {
            return shop_province;
        }

        public void setShop_province(String shop_province) {
            this.shop_province = shop_province;
        }

        public String getShop_city() {
            return shop_city;
        }

        public void setShop_city(String shop_city) {
            this.shop_city = shop_city;
        }

        public String getShop_region() {
            return shop_region;
        }

        public void setShop_region(String shop_region) {
            this.shop_region = shop_region;
        }

        public List<String> getCustomer_service() {
            return customer_service;
        }

        public void setCustomer_service(List<String> customer_service) {
            this.customer_service = customer_service;
        }

        public List<GoodsBean> getGoods() {
            return goods;
        }

        public void setGoods(List<GoodsBean> goods) {
            this.goods = goods;
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
