package com.ds.worldfunclub.responsebean;

public class CreateOrderResp extends BaseResponse {
    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static  class  DataBean{
        private String order_id;

        public String getOrder_id() {
            return  order_id;
        }

        public void setOrder_id(String order_id) {
            this.order_id = order_id;
        }
    }
}
