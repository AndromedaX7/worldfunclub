package com.ds.worldfunclub.responsebean;

import java.util.List;

public class ActiveBean {
    /**
     * code : 1
     * msg : success
     * data : [{"activity_id":"3","activity_name":"京东","activity_sign":"jd","type":"1","image_id":"200360","sort":"100","is_delete":"0","create_time":"2020-11-23 10:22:49","update_time":"2020-11-23 10:22:49","image":{"file_id":"200360","storage":"qiniu","group_id":"8","file_url":"http://storage.tule-live.com","file_name":"202010311357472254f4984.jpg","file_size":"12444","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/202010311357472254f4984.jpg"}}]
     */

    private int code;
    private String msg;
    /**
     * activity_id : 3
     * activity_name : 京东
     * activity_sign : jd
     * type : 1
     * image_id : 200360
     * sort : 100
     * is_delete : 0
     * create_time : 2020-11-23 10:22:49
     * update_time : 2020-11-23 10:22:49
     * image : {"file_id":"200360","storage":"qiniu","group_id":"8","file_url":"http://storage.tule-live.com","file_name":"202010311357472254f4984.jpg","file_size":"12444","file_type":"image","extension":"jpg","is_user":"0","is_recycle":"0","is_delete":"0","file_path":"http://storage.tule-live.com/202010311357472254f4984.jpg"}
     */

    private List<DataBean> data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        private String activity_id;
        private String activity_name;
        private String activity_sign;
        private String type;
        private String image_id;
        private String sort;
        private String is_delete;
        private String create_time;
        private String update_time;
        /**
         * file_id : 200360
         * storage : qiniu
         * group_id : 8
         * file_url : http://storage.tule-live.com
         * file_name : 202010311357472254f4984.jpg
         * file_size : 12444
         * file_type : image
         * extension : jpg
         * is_user : 0
         * is_recycle : 0
         * is_delete : 0
         * file_path : http://storage.tule-live.com/202010311357472254f4984.jpg
         */

        private HomeCategory.DataBean.ChildBean.ImageBean image;

        public String getActivity_id() {
            return activity_id;
        }

        public void setActivity_id(String activity_id) {
            this.activity_id = activity_id;
        }

        public String getActivity_name() {
            return activity_name;
        }

        public void setActivity_name(String activity_name) {
            this.activity_name = activity_name;
        }

        public String getActivity_sign() {
            return activity_sign;
        }

        public void setActivity_sign(String activity_sign) {
            this.activity_sign = activity_sign;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        public String getImage_id() {
            return image_id;
        }

        public void setImage_id(String image_id) {
            this.image_id = image_id;
        }

        public String getSort() {
            return sort;
        }

        public void setSort(String sort) {
            this.sort = sort;
        }

        public String getIs_delete() {
            return is_delete;
        }

        public void setIs_delete(String is_delete) {
            this.is_delete = is_delete;
        }

        public String getCreate_time() {
            return create_time;
        }

        public void setCreate_time(String create_time) {
            this.create_time = create_time;
        }

        public String getUpdate_time() {
            return update_time;
        }

        public void setUpdate_time(String update_time) {
            this.update_time = update_time;
        }

        public HomeCategory.DataBean.ChildBean.ImageBean getImage() {
            return image;
        }

        public void setImage(HomeCategory.DataBean.ChildBean.ImageBean image) {
            this.image = image;
        }

    }
}
