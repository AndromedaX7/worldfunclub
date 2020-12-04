package com.ds.worldfunclub.responsebean;

import android.text.TextUtils;

import com.ds.worldfunclub.base.ExtensionsKt;

import java.util.List;

public class CartData2 extends BaseResponse {


    /**
     * goods_list : [{"goods_id":"10037","goods_sku_id":"10169","goods_name":"苹果Xone","goods_image":"http://storage.tule-live.com/20201016191749d186d0949.jpg","goods_type":"1","spec_type":"20","goods_attr":"颜色:金色; 内存:16G; ","goods_price":"12.00","line_price":"123.00","stock_num":"123","shop_id":"0","shop_name":"商家自营","total_num":"1","total_price":"12.00","is_user_grade":"","grade_ratio":"0","grade_goods_price":"0","grade_total_money":"0","coupon_money":"0","total_pay_price":"12.00","points_bonus":"0"},{"goods_id":"10030","goods_sku_id":"10130","goods_name":"苹果X","goods_image":"http://storage.tule-live.com/20201016191749d186d0949.jpg","goods_type":"1","spec_type":"20","goods_attr":"颜色:黑色; 内存:16G; ","goods_price":"123.00","line_price":"123.00","stock_num":"123","shop_id":"0","shop_name":"商家自营","total_num":"1","total_price":"123.00","is_user_grade":"","grade_ratio":"0","grade_goods_price":"0","grade_total_money":"0","coupon_money":"0","total_pay_price":"123.00","points_bonus":"0"}]
     * order_total_num : 2
     * coupon_list : []
     * pay_type : 20
     * order_total_price : 135.00
     * coupon_id : 0
     * coupon_money : 0
     * order_price : 135.00
     * order_pay_price : 135.00
     */

    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static class DataBean {
        private String order_total_num;
        private String pay_type;
        private String order_total_price;
        private String coupon_id;
        private String coupon_money;
        private String order_price;
        private String order_pay_price;
        /**
         * goods_id : 10037
         * goods_sku_id : 10169
         * goods_name : 苹果Xone
         * goods_image : http://storage.tule-live.com/20201016191749d186d0949.jpg
         * goods_type : 1
         * spec_type : 20
         * goods_attr : 颜色:金色; 内存:16G;
         * goods_price : 12.00
         * line_price : 123.00
         * stock_num : 123
         * shop_id : 0
         * shop_name : 商家自营
         * total_num : 1
         * total_price : 12.00
         * is_user_grade :
         * grade_ratio : 0
         * grade_goods_price : 0
         * grade_total_money : 0
         * coupon_money : 0
         * total_pay_price : 12.00
         * points_bonus : 0
         */

        private List<GoodsListBean> goods_list;
        private List<?> coupon_list;

        public String getOrder_total_num() {
            return order_total_num;
        }

        public void setOrder_total_num(String order_total_num) {
            this.order_total_num = order_total_num;
        }

        public String getPay_type() {
            return pay_type;
        }

        public void setPay_type(String pay_type) {
            this.pay_type = pay_type;
        }

        public String getOrder_total_price() {
            return order_total_price;
        }

        public void setOrder_total_price(String order_total_price) {
            this.order_total_price = order_total_price;
        }

        public String getCoupon_id() {
            return coupon_id;
        }

        public void setCoupon_id(String coupon_id) {
            this.coupon_id = coupon_id;
        }

        public String getCoupon_money() {
            return coupon_money;
        }

        public void setCoupon_money(String coupon_money) {
            this.coupon_money = coupon_money;
        }

        public String getOrder_price() {
            return order_price;
        }

        public void setOrder_price(String order_price) {
            this.order_price = order_price;
        }

        public String getOrder_pay_price() {
            return order_pay_price;
        }

        public void setOrder_pay_price(String order_pay_price) {
            this.order_pay_price = order_pay_price;
        }

        public List<GoodsListBean> getGoods_list() {
            return goods_list;
        }

        public void setGoods_list(List<GoodsListBean> goods_list) {
            this.goods_list = goods_list;
        }

        public List<?> getCoupon_list() {
            return coupon_list;
        }

        public void setCoupon_list(List<?> coupon_list) {
            this.coupon_list = coupon_list;
        }

        public static class GoodsListBean {
            private boolean enabled;
            private boolean selected;

            private final String start_time="1";
            private String end_time;

            //TODO  not move flutter yet
            public boolean isEnabled() {
                return TextUtils.isEmpty(this.start_time)|| ExtensionsKt.stringToLong(this.start_time)*1000<System.currentTimeMillis();
            }

            public boolean isSelected() {
                return selected;
            }

            public void setEnabled(boolean enabled) {
                this.enabled = enabled;
            }

            public void setSelected(boolean selected) {
                this.selected = selected;
            }

            private  String cart_id;

            public String getCart_id() {
                return cart_id;
            }

            public void setCart_id(String cart_id) {
                this.cart_id = cart_id;
            }

            private String goods_id;
            private String goods_sku_id;
            private String goods_name;
            private String goods_image;
            private String goods_type;
            private String spec_type;
            private String goods_attr;
            private String goods_price;
            private String line_price;
            private String stock_num;
            private String shop_id;
            private String shop_name;
            private String total_num;
            private String total_price;
            private String is_user_grade;
            private String grade_ratio;
            private String grade_goods_price;
            private String grade_total_money;
            private String coupon_money;
            private String total_pay_price;
            private String points_bonus;

            public String getGoods_id() {
                return goods_id;
            }

            public void setGoods_id(String goods_id) {
                this.goods_id = goods_id;
            }

            public String getGoods_sku_id() {
                return goods_sku_id;
            }

            public void setGoods_sku_id(String goods_sku_id) {
                this.goods_sku_id = goods_sku_id;
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

            public String getGoods_type() {
                return goods_type;
            }

            public void setGoods_type(String goods_type) {
                this.goods_type = goods_type;
            }

            public String getSpec_type() {
                return spec_type;
            }

            public void setSpec_type(String spec_type) {
                this.spec_type = spec_type;
            }

            public String getGoods_attr() {
                return goods_attr;
            }

            public void setGoods_attr(String goods_attr) {
                this.goods_attr = goods_attr;
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

            public String getShop_id() {
                return shop_id;
            }

            public void setShop_id(String shop_id) {
                this.shop_id = shop_id;
            }

            public String getShop_name() {
                return shop_name;
            }

            public void setShop_name(String shop_name) {
                this.shop_name = shop_name;
            }

            public String getTotal_num() {
                return total_num;
            }

            public void setTotal_num(String total_num) {
                this.total_num = total_num;
            }

            public String getTotal_price() {
                return total_price;
            }

            public void setTotal_price(String total_price) {
                this.total_price = total_price;
            }

            public String getIs_user_grade() {
                return is_user_grade;
            }

            public void setIs_user_grade(String is_user_grade) {
                this.is_user_grade = is_user_grade;
            }

            public String getGrade_ratio() {
                return grade_ratio;
            }

            public void setGrade_ratio(String grade_ratio) {
                this.grade_ratio = grade_ratio;
            }

            public String getGrade_goods_price() {
                return grade_goods_price;
            }

            public void setGrade_goods_price(String grade_goods_price) {
                this.grade_goods_price = grade_goods_price;
            }

            public String getGrade_total_money() {
                return grade_total_money;
            }

            public void setGrade_total_money(String grade_total_money) {
                this.grade_total_money = grade_total_money;
            }

            public String getCoupon_money() {
                return coupon_money;
            }

            public void setCoupon_money(String coupon_money) {
                this.coupon_money = coupon_money;
            }

            public String getTotal_pay_price() {
                return total_pay_price;
            }

            public void setTotal_pay_price(String total_pay_price) {
                this.total_pay_price = total_pay_price;
            }

            public String getPoints_bonus() {
                return points_bonus;
            }

            public void setPoints_bonus(String points_bonus) {
                this.points_bonus = points_bonus;
            }
        }
    }
}
