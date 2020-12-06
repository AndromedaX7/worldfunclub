package com.ds.worldfunclub.responsebean;

public class BalancePayAuthBean extends BaseResponse {

    /**
     * data : {"appid":"wx43736892a139b092","partnerid":"1602989977","prepayid":"wx27155033884698a83ae9cd78e336990000","package":"Sign=WXPay","timestamp":"1601193033","noncestr":"4gvsbn3ca7lcbzi96nq94g3gf8x8b2hh","sign":"316420967BD62D79682BB6547F40B885"}
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
         * appid : wx43736892a139b092
         * partnerid : 1602989977
         * prepayid : wx27155033884698a83ae9cd78e336990000
         * package : Sign=WXPay
         * timestamp : 1601193033
         * noncestr : 4gvsbn3ca7lcbzi96nq94g3gf8x8b2hh
         * sign : 316420967BD62D79682BB6547F40B885
         */

        private String pay_type;

        public String getPay_type() {
            return pay_type;
        }

        public void setPay_type(String pay_type) {
            this.pay_type = pay_type;
        }

    }
}
