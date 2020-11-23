package com.ds.worldfunclub.responsebean;

public class ScanInfoBean extends BaseResponse {

    /**
     * order_id : 348
     * write_off : 20102961899601
     * order_no : 2020102998975399
     * total_num : 1
     * name : 你您在
     * goods_name : 烧靠预约多规格
     * writeOff_num : 1
     * phone : 15590285788
     * lh_start_time : 2020-10-28 00:00:00
     * lh_end_time : 2021-02-28 00:00:00
     */

    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static class DataBean {
        private String order_id;
        private String write_off;
        private String order_no;
        private String total_num;
        private String name;
        private String goods_name;
        private String writeOff_num;
        private String phone;
        private String lh_start_time;
        private String lh_end_time;

        public String getOrder_id() {
            return order_id;
        }

        public void setOrder_id(String order_id) {
            this.order_id = order_id;
        }

        public String getWrite_off() {
            return write_off;
        }

        public void setWrite_off(String write_off) {
            this.write_off = write_off;
        }

        public String getOrder_no() {
            return order_no;
        }

        public void setOrder_no(String order_no) {
            this.order_no = order_no;
        }

        public String getTotal_num() {
            return total_num;
        }

        public void setTotal_num(String total_num) {
            this.total_num = total_num;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getGoods_name() {
            return goods_name;
        }

        public void setGoods_name(String goods_name) {
            this.goods_name = goods_name;
        }

        public String getWriteOff_num() {
            return writeOff_num;
        }

        public void setWriteOff_num(String writeOff_num) {
            this.writeOff_num = writeOff_num;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getLh_start_time() {
            return lh_start_time;
        }

        public void setLh_start_time(String lh_start_time) {
            this.lh_start_time = lh_start_time;
        }

        public String getLh_end_time() {
            return lh_end_time;
        }

        public void setLh_end_time(String lh_end_time) {
            this.lh_end_time = lh_end_time;
        }
    }
}
