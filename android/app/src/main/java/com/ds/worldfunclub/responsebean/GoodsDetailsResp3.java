package com.ds.worldfunclub.responsebean;

import java.util.List;

public class GoodsDetailsResp3 extends BaseResponse {


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

    public static class DataBean extends GoodsDetailsResp2.DataBean {

        private ShopInfoBean shopInfo;

        public ShopInfoBean getShopInfo() {
            return shopInfo;
        }

        public void setShopInfo(ShopInfoBean shopInfo) {
            this.shopInfo = shopInfo;
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
