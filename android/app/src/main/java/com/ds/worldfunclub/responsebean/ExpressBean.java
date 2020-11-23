package com.ds.worldfunclub.responsebean;

import java.util.List;

public class ExpressBean extends BaseResponse {
    /**
     * deliveryNo : 2222
     * deliveryName : 顺丰速递
     * deliveryList : [{"title":"","context":"本次配送完成，祝您生活愉快！","time":"2018-04-15 18:04:23","operator":"系统"},{"title":"","context":"【揭阳】 的杨晓明东山业务（xxx） 正在第1次派件, 请保持电话畅通,并耐心等待","time":"2018-04-15 18:04:23","operator":"系统"}]
     * goods_image : http://storage.tule-live.com/20201031135730a90a27868.jpg
     */

    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static class DataBean {
        private String deliveryNo;
        private String deliveryName;
        private String goods_image;
        /**
         * title :
         * context : 本次配送完成，祝您生活愉快！
         * time : 2018-04-15 18:04:23
         * operator : 系统
         */

        private List<DeliveryListBean> deliveryList;

        public String getDeliveryNo() {
            return deliveryNo;
        }

        public void setDeliveryNo(String deliveryNo) {
            this.deliveryNo = deliveryNo;
        }

        public String getDeliveryName() {
            return deliveryName;
        }

        public void setDeliveryName(String deliveryName) {
            this.deliveryName = deliveryName;
        }

        public String getGoods_image() {
            return goods_image;
        }

        public void setGoods_image(String goods_image) {
            this.goods_image = goods_image;
        }

        public List<DeliveryListBean> getDeliveryList() {
            return deliveryList;
        }

        public void setDeliveryList(List<DeliveryListBean> deliveryList) {
            this.deliveryList = deliveryList;
        }

        public static class DeliveryListBean {
            private String title;
            private String context;
            private String time;
            private String operator;

            public String getTitle() {
                return title;
            }

            public void setTitle(String title) {
                this.title = title;
            }

            public String getContext() {
                return context;
            }

            public void setContext(String context) {
                this.context = context;
            }

            public String getTime() {
                return time;
            }

            public void setTime(String time) {
                this.time = time;
            }

            public String getOperator() {
                return operator;
            }

            public void setOperator(String operator) {
                this.operator = operator;
            }
        }
    }
}
