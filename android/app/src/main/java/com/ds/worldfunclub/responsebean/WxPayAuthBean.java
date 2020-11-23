package com.ds.worldfunclub.responsebean;

import com.google.gson.annotations.SerializedName;

public class WxPayAuthBean extends BaseResponse {

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

        private String appid;
        private String partnerid;
        private String prepayid;
        @SerializedName("package")
        private String packageX;
        private String timestamp;
        private String noncestr;
        private String sign;
        private String pay_type;

        public String getPay_type() {
            return pay_type;
        }

        public void setPay_type(String pay_type) {
            this.pay_type = pay_type;
        }

        public String getAppid() {
            return appid;
        }

        public void setAppid(String appid) {
            this.appid = appid;
        }

        public String getPartnerid() {
            return partnerid;
        }

        public void setPartnerid(String partnerid) {
            this.partnerid = partnerid;
        }

        public String getPrepayid() {
            return prepayid;
        }

        public void setPrepayid(String prepayid) {
            this.prepayid = prepayid;
        }

        public String getPackageX() {
            return packageX;
        }

        public void setPackageX(String packageX) {
            this.packageX = packageX;
        }

        public String getTimestamp() {
            return timestamp;
        }

        public void setTimestamp(String timestamp) {
            this.timestamp = timestamp;
        }

        public String getNoncestr() {
            return noncestr;
        }

        public void setNoncestr(String noncestr) {
            this.noncestr = noncestr;
        }

        public String getSign() {
            return sign;
        }

        public void setSign(String sign) {
            this.sign = sign;
        }
    }
}
