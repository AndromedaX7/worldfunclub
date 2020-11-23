package com.ds.worldfunclub.responsebean;

import java.util.List;

public class CommentData extends BaseResponse {
    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }


    public static class DataBean {
        private List<CommentDataBean> list;
        private  CommentTypeNumber  comment_type_number;

        public void setList(List< CommentDataBean> list) {
            this.list = list;
        }

        public CommentTypeNumber  getComment_type_number() {
            return comment_type_number;
        }

        public List< CommentDataBean> getList() {
            return list;
        }

        public void setComment_type_number( CommentTypeNumber  comment_type_number) {
            this.comment_type_number = comment_type_number;
        }
    }

    public static class CommentDataBean extends GoodsDetailsResp2.DataBean.CommentDataBean{

        private String nickname;
        private String avatar;



        public String getNickName() {
            return nickname;
        }

        public void setNickName(String nickName) {
            this.nickname = nickName;
        }

        public String getAvatarUrl() {
            return avatar;
        }

        public void setAvatarUrl(String avatarUrl) {
            this.avatar = avatarUrl;
        }

    }


    public static class CommentTypeNumber {
        private String all_num;
        private String praise_num;
        private String review_num;
        private String negative_num;
        private String picture_num;


        public String getAll_num() {
            return all_num;
        }

        public void setAll_num(String all_num) {
            this.all_num = all_num;
        }

        public String getPraise_num() {
            return praise_num;
        }

        public void setPraise_num(String praise_num) {
            this.praise_num = praise_num;
        }

        public String getReview_num() {
            return review_num;
        }

        public void setReview_num(String review_num) {
            this.review_num = review_num;
        }

        public String getNegative_num() {
            return negative_num;
        }

        public void setNegative_num(String negative_num) {
            this.negative_num = negative_num;
        }

        public String getPicture_num() {
            return picture_num;
        }

        public void setPicture_num(String picture_num) {
            this.picture_num = picture_num;
        }
    }
}
