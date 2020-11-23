package com.ds.worldfunclub.responsebean;

import java.util.List;

public class GoodsCouponData extends BaseResponse {

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * coupon_type_id : 1
         * time : 2020-09-05~2020-09-15
         * money : 123.00
         * desc : 满123元使用
         * status : 1
         * status_detial :
         */

        private String coupon_type_id;
        private String time;
        private String money;
        private String desc;
        private String status;
        private String status_detial;

        public String getCoupon_type_id() {
            return coupon_type_id;
        }

        public void setCoupon_type_id(String coupon_type_id) {
            this.coupon_type_id = coupon_type_id;
        }

        public String getTime() {
            return time;
        }

        public void setTime(String time) {
            this.time = time;
        }

        public String getMoney() {
            return money;
        }

        public String money() {
            if (money.contains("."))
                return money.split("\\.")[0];
            else
                return money;
        }

        public void setMoney(String money) {
            this.money = money;
        }

        public String getDesc() {
            return desc;
        }

        public void setDesc(String desc) {
            this.desc = desc;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public String getStatus_detial() {
            return status_detial;
        }

        public void setStatus_detial(String status_detial) {
            this.status_detial = status_detial;
        }
    }
}
