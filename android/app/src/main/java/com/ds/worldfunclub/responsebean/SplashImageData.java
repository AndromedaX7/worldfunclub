package com.ds.worldfunclub.responsebean;

public class SplashImageData extends  BaseResponse {
    /**
     * data : {"image_url":"http://tule-live.com/upload/1/common/images/20200824/20200824020127159824888798733.png","jump_url":"www.baidu.com"}
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
         * image_url : http://tule-live.com/upload/1/common/images/20200824/20200824020127159824888798733.png
         * jump_url : www.baidu.com
         */

        private String image_url;
        private String jump_url;

        public String getImage_url() {
            return image_url;
        }

        public void setImage_url(String image_url) {
            this.image_url = image_url;
        }

        public String getJump_url() {
            return jump_url;
        }

        public void setJump_url(String jump_url) {
            this.jump_url = jump_url;
        }
    }
}
