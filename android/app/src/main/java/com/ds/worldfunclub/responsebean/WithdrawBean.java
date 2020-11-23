package com.ds.worldfunclub.responsebean;

import java.util.List;

public class WithdrawBean extends  BaseResponse {

    /**
     * name : 提现到银行卡-中国工商银行(尾号2523)
     * set_time : 2020-11-09 13:59:34
     * money : +1600.00
     * type : 2
     */

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        private String desc;
        private String set_time;
        private String money;
        private String type;

        public String getName() {
            return desc;
        }

        public void setName(String name) {
            this.desc = name;
        }

        public String getSet_time() {
            return set_time;
        }

        public void setSet_time(String set_time) {
            this.set_time = set_time;
        }

        public String getMoney() {
            return money;
        }

        public void setMoney(String money) {
            this.money = money;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }
    }
}
