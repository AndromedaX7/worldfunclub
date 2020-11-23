package com.ds.worldfunclub.responsebean;

import java.util.List;

public class BankListBean extends  BaseResponse {

    /**
     * bankcard_id : 1
     * bank_name : 中国工商银行（储蓄卡）
     * bank_card : 6212 **** **** **** 523
     * bank_account : 东盛大街支行
     */

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        private String bankcard_id;
        private String bank_name;
        private String bank_card;
        private String bank_account;

        public String getBankcard_id() {
            return bankcard_id;
        }

        public void setBankcard_id(String bankcard_id) {
            this.bankcard_id = bankcard_id;
        }

        public String getBank_name() {
            return bank_name;
        }

        public void setBank_name(String bank_name) {
            this.bank_name = bank_name;
        }

        public String getBank_card() {
            return bank_card;
        }

        public void setBank_card(String bank_card) {
            this.bank_card = bank_card;
        }

        public String getBank_account() {
            return bank_account;
        }

        public void setBank_account(String bank_account) {
            this.bank_account = bank_account;
        }
    }
}
