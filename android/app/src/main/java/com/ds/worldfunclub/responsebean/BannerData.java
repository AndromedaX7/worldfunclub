package com.ds.worldfunclub.responsebean;

import java.util.List;

public class BannerData extends BaseResponse {
    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean {
        /**
         * id : 5
         * image_url : http://mall.com/upload/1/common/images/20200825/20200825014325159833420558476.jpg
         * jump_url : www.baidu.com
         */

        private String goods_id;
        private String img_url;

        public String getGoods_id() {
            return goods_id;
        }

        public String getImg_url() {
            return img_url;
        }

        public void setGoods_id(String goods_id) {
            this.goods_id = goods_id;
        }

        public void setImg_url(String img_url) {
            this.img_url = img_url;
        }
    }
}
