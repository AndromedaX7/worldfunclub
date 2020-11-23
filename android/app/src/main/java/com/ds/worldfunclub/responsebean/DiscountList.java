package com.ds.worldfunclub.responsebean;

import java.util.List;

public class DiscountList extends  BaseResponse {
    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * discount_id : 7
         * show_start_time : 21:00
         * start_time : 2020-08-28 21:00
         * end_time : 2020-08-31 20:00
         * checked : 1
         * time_difference : 44263
         * status : 1
         * type : 1
         * title : 昨日精选
         */

        private String discount_id;
        private String show_start_time;
        private String start_time;
        private String end_time;
        private String checked;
        private String time_difference;
        private String status;
        private String type;
        private String title;

        public String getDiscount_id() {
            return discount_id;
        }

        public void setDiscount_id(String discount_id) {
            this.discount_id = discount_id;
        }

        public String getShow_start_time() {
            return show_start_time;
        }

        public void setShow_start_time(String show_start_time) {
            this.show_start_time = show_start_time;
        }

        public String getStart_time() {
            return start_time;
        }

        public void setStart_time(String start_time) {
            this.start_time = start_time;
        }

        public String getEnd_time() {
            return end_time;
        }

        public void setEnd_time(String end_time) {
            this.end_time = end_time;
        }

        public String getChecked() {
            return checked;
        }

        public void setChecked(String checked) {
            this.checked = checked;
        }

        public String getTime_difference() {
            return time_difference;
        }

        public void setTime_difference(String time_difference) {
            this.time_difference = time_difference;
        }

        public String getStatus() {
            return status;
        }

        public void setStatus(String status) {
            this.status = status;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }
    }
}
