package com.ds.worldfunclub.responsebean;

import java.util.List;

public class UserCoupon extends  BaseResponse {

    /**
     * data : {"count":"1","list":[{"id":"15","user_center_id":"2","coupon_type_id":"1","coupon_name":"123","at_least":"123.00","money":"123.00","status":"1"}]}
     */

    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * count : 1
         * list : [{"id":"15","user_center_id":"2","coupon_type_id":"1","coupon_name":"123","at_least":"123.00","money":"123.00","status":"1"}]
         */

        private String count;
        private List<ListBean> list;

        public String getCount() {
            return count;
        }

        public void setCount(String count) {
            this.count = count;
        }

        public List<ListBean> getList() {
            return list;
        }

        public void setList(List<ListBean> list) {
            this.list = list;
        }

        public static class ListBean {
            /**
             * id : 15
             * user_center_id : 2
             * coupon_type_id : 1
             * coupon_name : 123
             * at_least : 123.00
             * money : 123.00
             * status : 1
             */

            private String id;
            private String user_center_id;
            private String coupon_type_id;
            private String coupon_name;
            private String at_least;
            private String money;
            private String status;

            public String getId() {
                return id;
            }

            public void setId(String id) {
                this.id = id;
            }

            public String getUser_center_id() {
                return user_center_id;
            }

            public void setUser_center_id(String user_center_id) {
                this.user_center_id = user_center_id;
            }

            public String getCoupon_type_id() {
                return coupon_type_id;
            }

            public void setCoupon_type_id(String coupon_type_id) {
                this.coupon_type_id = coupon_type_id;
            }

            public String getCoupon_name() {
                return coupon_name;
            }

            public void setCoupon_name(String coupon_name) {
                this.coupon_name = coupon_name;
            }

            public String getAt_least() {
                return at_least;
            }

            public void setAt_least(String at_least) {
                this.at_least = at_least;
            }

            public String getMoney() {
                return money;
            }

            public void setMoney(String money) {
                this.money = money;
            }

            public String getStatus() {
                return status;
            }

            public void setStatus(String status) {
                this.status = status;
            }
        }
    }
}
