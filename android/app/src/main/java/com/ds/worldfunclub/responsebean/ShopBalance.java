package com.ds.worldfunclub.responsebean;

public class ShopBalance  extends BaseResponse{

    /**
     * shop_balance : 0.00
     */

    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static class DataBean {
        private String shop_balance;

        public String getShop_balance() {
            return shop_balance;
        }

        public void setShop_balance(String shop_balance) {
            this.shop_balance = shop_balance;
        }
    }
}
