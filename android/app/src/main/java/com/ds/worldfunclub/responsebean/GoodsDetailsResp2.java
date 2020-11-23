package com.ds.worldfunclub.responsebean;

import java.util.List;

public class GoodsDetailsResp2 extends BaseResponse {


    /**
     * goods_id : 10017
     * goods_name : 苹果X
     * selling_point : 苹果苹果
     * category_id : 10042
     * goods_type : 1
     * spec_type : 20
     * content : <p><img src="http://file.mos.ink/20201014105901fef4f7680.png"/></p><p><img src="http://storage.tule-live.com/20201016191749d186d0949.jpg"/></p><p><br/></p>
     * is_shop : 1
     * shop_id : 0
     * subscribe : 10
     * lh_start_time : 0
     * lh_end_time : 0
     * goods_sales : 1000
     * collected_status : 1
     * comment_data : []
     * comment_data_count : 0
     * goods_images : ["http://storage.tule-live.com/20201016191749d186d0949.jpg","http://storage.tule-live.com/20201016191749d186d0949.jpg","http://file.mos.ink/20201014105901fef4f7680.png"]
     * spec_attr : [{"group_id":"10002","group_name":"颜色","spec_items":[{"item_id":"10020","spec_value":"金色"},{"item_id":"10010","spec_value":"黑色"},{"item_id":"10021","spec_value":"银色"}]},{"group_id":"10003","group_name":"内存","spec_items":[{"item_id":"10008","spec_value":"16G"},{"item_id":"10012","spec_value":"32G"},{"item_id":"10022","spec_value":"256G"},{"item_id":"10023","spec_value":"512G"}]}]
     * sku_list : [{"goods_sku_id":"10100","goods_id":"10017","spec_sku_id":"10020_10008","image_id":"10002","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://file.mos.ink/20201014105901fef4f7680.png"},{"goods_sku_id":"10101","goods_id":"10017","spec_sku_id":"10020_10012","image_id":"10003","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg"},{"goods_sku_id":"10102","goods_id":"10017","spec_sku_id":"10020_10022","image_id":"10002","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://file.mos.ink/20201014105901fef4f7680.png"},{"goods_sku_id":"10103","goods_id":"10017","spec_sku_id":"10020_10023","image_id":"10003","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg"},{"goods_sku_id":"10104","goods_id":"10017","spec_sku_id":"10010_10008","image_id":"10002","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://file.mos.ink/20201014105901fef4f7680.png"},{"goods_sku_id":"10105","goods_id":"10017","spec_sku_id":"10010_10012","image_id":"10003","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg"},{"goods_sku_id":"10106","goods_id":"10017","spec_sku_id":"10010_10022","image_id":"10002","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://file.mos.ink/20201014105901fef4f7680.png"},{"goods_sku_id":"10107","goods_id":"10017","spec_sku_id":"10010_10023","image_id":"10003","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg"},{"goods_sku_id":"10108","goods_id":"10017","spec_sku_id":"10021_10008","image_id":"10002","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://file.mos.ink/20201014105901fef4f7680.png"},{"goods_sku_id":"10109","goods_id":"10017","spec_sku_id":"10021_10012","image_id":"10003","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg"},{"goods_sku_id":"10110","goods_id":"10017","spec_sku_id":"10021_10022","image_id":"10002","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://file.mos.ink/20201014105901fef4f7680.png"},{"goods_sku_id":"10111","goods_id":"10017","spec_sku_id":"10021_10023","image_id":"10003","goods_no":"123","goods_price":"123.00","line_price":"123.00","stock_num":"123","goods_sales":"0","goods_weight":"123","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg"}]
     * cart_total_num : 0
     */

    private DataBean data;

    public DataBean getData() {
        return data;
    }

    public void setData(DataBean data) {
        this.data = data;
    }

    public static class DataBean {
        private String goods_id;
        private String goods_name;
        private String selling_point;
        private String category_id;
        private String goods_type;
        private String spec_type;
        private String content;
        private String is_shop;
        private String shop_id;
        private String subscribe;
        private String lh_start_time;
        private String lh_end_time;
        private String goods_sales;
        private String collected_status;
        private String comment_data_count;
        private String cart_total_num;
        private List<CommentDataBean> comment_data;
        private List<String> goods_images;

        /**
         * group_id : 10002
         * group_name : 颜色
         * spec_items : [{"item_id":"10020","spec_value":"金色"},{"item_id":"10010","spec_value":"黑色"},{"item_id":"10021","spec_value":"银色"}]
         */

        private List<SpecAttrBean> spec_attr;
        /**
         * goods_sku_id : 10100
         * goods_id : 10017
         * spec_sku_id : 10020_10008
         * image_id : 10002
         * goods_no : 123
         * goods_price : 123.00
         * line_price : 123.00
         * stock_num : 123
         * goods_sales : 0
         * goods_weight : 123
         * image : http://file.mos.ink/20201014105901fef4f7680.png
         */

        private List<SkuListBean> sku_list;

        public String getGoods_id() {
            return goods_id;
        }

        public void setGoods_id(String goods_id) {
            this.goods_id = goods_id;
        }

        public String getGoods_name() {
            return goods_name;
        }

        public void setGoods_name(String goods_name) {
            this.goods_name = goods_name;
        }

        public String getSelling_point() {
            return selling_point;
        }

        public void setSelling_point(String selling_point) {
            this.selling_point = selling_point;
        }

        public String getCategory_id() {
            return category_id;
        }

        public void setCategory_id(String category_id) {
            this.category_id = category_id;
        }

        public String getGoods_type() {
            return goods_type;
        }

        public void setGoods_type(String goods_type) {
            this.goods_type = goods_type;
        }

        public String getSpec_type() {
            return spec_type;
        }

        public void setSpec_type(String spec_type) {
            this.spec_type = spec_type;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public String getIs_shop() {
            return is_shop;
        }

        public void setIs_shop(String is_shop) {
            this.is_shop = is_shop;
        }

        public String getShop_id() {
            return shop_id;
        }

        public void setShop_id(String shop_id) {
            this.shop_id = shop_id;
        }

        public String getSubscribe() {
            return subscribe;
        }

        public void setSubscribe(String subscribe) {
            this.subscribe = subscribe;
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

        public String getGoods_sales() {
            return goods_sales;
        }

        public void setGoods_sales(String goods_sales) {
            this.goods_sales = goods_sales;
        }

        public String getCollected_status() {
            return collected_status;
        }

        public void setCollected_status(String collected_status) {
            this.collected_status = collected_status;
        }

        public String getComment_data_count() {
            return comment_data_count;
        }

        public void setComment_data_count(String comment_data_count) {
            this.comment_data_count = comment_data_count;
        }

        public String getCart_total_num() {
            return cart_total_num;
        }

        public void setCart_total_num(String cart_total_num) {
            this.cart_total_num = cart_total_num;
        }

        public List<CommentDataBean> getComment_data() {
            return comment_data;
        }

        public void setComment_data(List<CommentDataBean> comment_data) {
            this.comment_data = comment_data;
        }

        public List<String> getGoods_images() {
            return goods_images;
        }

        public void setGoods_images(List<String> goods_images) {
            this.goods_images = goods_images;
        }

        public List<SpecAttrBean> getSpec_attr() {
            return spec_attr;
        }

        public void setSpec_attr(List<SpecAttrBean> spec_attr) {
            this.spec_attr = spec_attr;
        }

        public List<SkuListBean> getSku_list() {
            return sku_list;
        }

        public void setSku_list(List<SkuListBean> sku_list) {
            this.sku_list = sku_list;
        }

        public static class SpecAttrBean {
            private String group_id;
            private String group_name;
            /**
             * item_id : 10020
             * spec_value : 金色
             */

            private List<SpecItemsBean> spec_items;

            public String getGroup_id() {
                return group_id;
            }

            public void setGroup_id(String group_id) {
                this.group_id = group_id;
            }

            public String getGroup_name() {
                return group_name;
            }

            public void setGroup_name(String group_name) {
                this.group_name = group_name;
            }

            public List<SpecItemsBean> getSpec_items() {
                return spec_items;
            }

            public void setSpec_items(List<SpecItemsBean> spec_items) {
                this.spec_items = spec_items;
            }

            public static class SpecItemsBean {
                private String item_id;
                private String spec_value;

                public String getItem_id() {
                    return item_id;
                }

                public void setItem_id(String item_id) {
                    this.item_id = item_id;
                }

                public String getSpec_value() {
                    return spec_value;
                }

                public void setSpec_value(String spec_value) {
                    this.spec_value = spec_value;
                }
            }
        }

        public static class SkuListBean {
            private String goods_sku_id;
            private String goods_id;
            private String spec_sku_id;
            private String image_id;
            private String goods_no;
            private String goods_price;
            private String line_price;
            private String stock_num;
            private String goods_sales;
            private String goods_weight;
            private String image;

            public String getGoods_sku_id() {
                return goods_sku_id;
            }

            public void setGoods_sku_id(String goods_sku_id) {
                this.goods_sku_id = goods_sku_id;
            }

            public String getGoods_id() {
                return goods_id;
            }

            public void setGoods_id(String goods_id) {
                this.goods_id = goods_id;
            }

            public String getSpec_sku_id() {
                return spec_sku_id;
            }

            public void setSpec_sku_id(String spec_sku_id) {
                this.spec_sku_id = spec_sku_id;
            }

            public String getImage_id() {
                return image_id;
            }

            public void setImage_id(String image_id) {
                this.image_id = image_id;
            }

            public String getGoods_no() {
                return goods_no;
            }

            public void setGoods_no(String goods_no) {
                this.goods_no = goods_no;
            }

            public String getGoods_price() {
                return goods_price;
            }

            public void setGoods_price(String goods_price) {
                this.goods_price = goods_price;
            }

            public String getLine_price() {
                return line_price;
            }

            public void setLine_price(String line_price) {
                this.line_price = line_price;
            }

            public String getStock_num() {
                return stock_num;
            }

            public void setStock_num(String stock_num) {
                this.stock_num = stock_num;
            }

            public String getGoods_sales() {
                return goods_sales;
            }

            public void setGoods_sales(String goods_sales) {
                this.goods_sales = goods_sales;
            }

            public String getGoods_weight() {
                return goods_weight;
            }

            public void setGoods_weight(String goods_weight) {
                this.goods_weight = goods_weight;
            }

            public String getImage() {
                return image;
            }

            public void setImage(String image) {
                this.image = image;
            }
        }


        public static class CommentDataBean {
            private String comment_id;
            private String star;
            private String content;
            private String create_time;
            private String user_id;
            private String nickName;
            private String avatarUrl;
            private List<String> images;
            private String goods_attr;
            private String thumb_num;
            private  String is_thumb;

            public String getGoods_attr() {
                return goods_attr;
            }

            public void setGoods_attr(String goods_attr) {
                this.goods_attr = goods_attr;
            }

            public String getThumb_num() {
                return thumb_num;
            }

            public void setThumb_num(String thumb_num) {
                this.thumb_num = thumb_num;
            }

            public String getIs_thumb() {
                return is_thumb;
            }

            public void setIs_thumb(String is_thumb) {
                this.is_thumb = is_thumb;
            }

            public String getComment_id() {
                return comment_id;
            }

            public void setComment_id(String comment_id) {
                this.comment_id = comment_id;
            }

            public String getStar() {
                return star;
            }

            public void setStar(String star) {
                this.star = star;
            }

            public String getContent() {
                return content;
            }

            public void setContent(String content) {
                this.content = content;
            }

            public String getCreate_time() {
                return create_time;
            }

            public void setCreate_time(String create_time) {
                this.create_time = create_time;
            }

            public String getUser_id() {
                return user_id;
            }

            public void setUser_id(String user_id) {
                this.user_id = user_id;
            }

            public String getNickName() {
                return nickName;
            }

            public void setNickName(String nickName) {
                this.nickName = nickName;
            }

            public String getAvatarUrl() {
                return avatarUrl;
            }

            public void setAvatarUrl(String avatarUrl) {
                this.avatarUrl = avatarUrl;
            }

            public List<String> getImages() {
                return images;
            }

            public void setImages(List<String> images) {
                this.images = images;
            }
        }


    }

    public static class ShopInfoBean {
        private String shop_id;
        private String shop_name;
        private String phone;
        private String shop_hours;
        private String address;
        private String longitude;
        private String latitude;
        private String logo;
        private String province;
        private String city;
        private String region;

        public String getShop_id() {
            return shop_id;
        }

        public void setShop_id(String shop_id) {
            this.shop_id = shop_id;
        }

        public String getShop_name() {
            return shop_name;
        }

        public void setShop_name(String shop_name) {
            this.shop_name = shop_name;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getShop_hours() {
            return shop_hours;
        }

        public void setShop_hours(String shop_hours) {
            this.shop_hours = shop_hours;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getLongitude() {
            return longitude;
        }

        public void setLongitude(String longitude) {
            this.longitude = longitude;
        }

        public String getLatitude() {
            return latitude;
        }

        public void setLatitude(String latitude) {
            this.latitude = latitude;
        }

        public String getLogo() {
            return logo;
        }

        public void setLogo(String logo) {
            this.logo = logo;
        }

        public String getProvince() {
            return province;
        }

        public void setProvince(String province) {
            this.province = province;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getRegion() {
            return region;
        }

        public void setRegion(String region) {
            this.region = region;
        }
    }

}
