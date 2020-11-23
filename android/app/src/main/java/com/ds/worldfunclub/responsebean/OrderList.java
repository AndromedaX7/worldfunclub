package com.ds.worldfunclub.responsebean;

import android.os.Parcel;
import android.os.Parcelable;

import com.ds.worldfunclub.base.ExtensionsKt;

import java.util.List;

public class OrderList extends BaseResponse {

    /**
     * order_id : 225
     * order_no : 2020102410099501
     * goods_num : 2
     * shop_name : 途乐会自营
     * state_text : 待付款
     * order_status : 10
     * lh_order_status : 10
     * goods : [{"order_goods_id":"212","goods_id":"10030","goods_name":"苹果XXXXX","goods_price":"123.00","total_num":"1","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg","goods_attr":"颜色:金色; 内存:32G; "},{"order_goods_id":"213","goods_id":"10030","goods_name":"苹果XXXXX","goods_price":"123.00","total_num":"1","image":"http://storage.tule-live.com/20201016191749d186d0949.jpg","goods_attr":"颜色:金色; 内存:16G; "}]
     */

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean  implements  Parcelable{
        public DataBean(){}
        private String order_id;
        private String order_no;
        private String goods_num;
        private String shop_name;
        private String state_text;
        private String order_status;
        private String lh_order_status;
        private String goods_money;
        /**
         * order_goods_id : 212
         * goods_id : 10030
         * goods_name : 苹果XXXXX
         * goods_price : 123.00
         * total_num : 1
         * image : http://storage.tule-live.com/20201016191749d186d0949.jpg
         * goods_attr : 颜色:金色; 内存:32G;
         */

        private List<GoodsBean> goods;

        protected DataBean(Parcel in) {
            order_id = in.readString();
            order_no = in.readString();
            goods_num = in.readString();
            shop_name = in.readString();
            state_text = in.readString();
            order_status = in.readString();
            lh_order_status = in.readString();
            goods_money = in.readString();
            goods = in.createTypedArrayList(GoodsBean.CREATOR);
        }

        public static final Creator<DataBean> CREATOR = new Creator<DataBean>() {
            @Override
            public DataBean createFromParcel(Parcel in) {
                return new DataBean(in);
            }

            @Override
            public DataBean[] newArray(int size) {
                return new DataBean[size];
            }
        };

        public String getGoods_money() {
            double money = 0;
            for (GoodsBean g : goods) {
                money += ExtensionsKt.stringToDouble(g.goods_price) * ExtensionsKt.stringToDouble(g.total_num);
            }
            goods_money = ExtensionsKt.toYuan(money);
            return goods_money;
        }

        public void setGoods_money(String goods_money) {
            this.goods_money = goods_money;
        }

        public String getOrder_id() {
            return order_id;
        }

        public void setOrder_id(String order_id) {
            this.order_id = order_id;
        }

        public String getOrder_no() {
            return order_no;
        }

        public void setOrder_no(String order_no) {
            this.order_no = order_no;
        }

        public String getGoods_num() {
            return goods_num;
        }

        public void setGoods_num(String goods_num) {
            this.goods_num = goods_num;
        }

        public String getShop_name() {
            return shop_name;
        }

        public void setShop_name(String shop_name) {
            this.shop_name = shop_name;
        }

        public String getState_text() {
            return state_text;
        }

        public void setState_text(String state_text) {
            this.state_text = state_text;
        }

        public String getOrder_status() {
            return order_status;
        }

        public void setOrder_status(String order_status) {
            this.order_status = order_status;
        }

        public String getLh_order_status() {
            return lh_order_status;
        }

        public void setLh_order_status(String lh_order_status) {
            this.lh_order_status = lh_order_status;
        }

        public List<GoodsBean> getGoods() {
            return goods;
        }

        public void setGoods(List<GoodsBean> goods) {
            this.goods = goods;
        }

        @Override
        public int describeContents() {
            return 0;
        }

        @Override
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(order_id);
            dest.writeString(order_no);
            dest.writeString(goods_num);
            dest.writeString(shop_name);
            dest.writeString(state_text);
            dest.writeString(order_status);
            dest.writeString(lh_order_status);
            dest.writeString(goods_money);
            dest.writeTypedList(goods);
        }

        public static class GoodsBean implements Parcelable {
            public GoodsBean(){}
            private String order_goods_id;
            private String goods_id;
            private String goods_name;
            private String goods_price;
            private String total_num;
            private String image;
            private String goods_attr;

            protected GoodsBean(Parcel in) {
                order_goods_id = in.readString();
                goods_id = in.readString();
                goods_name = in.readString();
                goods_price = in.readString();
                total_num = in.readString();
                image = in.readString();
                goods_attr = in.readString();
            }

            public static final Creator<GoodsBean> CREATOR = new Creator<GoodsBean>() {
                @Override
                public GoodsBean createFromParcel(Parcel in) {
                    return new GoodsBean(in);
                }

                @Override
                public GoodsBean[] newArray(int size) {
                    return new GoodsBean[size];
                }
            };

            public String getOrder_goods_id() {
                return order_goods_id;
            }

            public void setOrder_goods_id(String order_goods_id) {
                this.order_goods_id = order_goods_id;
            }

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

            public String getGoods_price() {
                return goods_price;
            }

            public void setGoods_price(String goods_price) {
                this.goods_price = goods_price;
            }

            public String getTotal_num() {
                return total_num;
            }

            public void setTotal_num(String total_num) {
                this.total_num = total_num;
            }

            public String getImage() {
                return image;
            }

            public void setImage(String image) {
                this.image = image;
            }

            public String getGoods_attr() {
                return goods_attr;
            }

            public void setGoods_attr(String goods_attr) {
                this.goods_attr = goods_attr;
            }

            @Override
            public int describeContents() {
                return 0;
            }

            @Override
            public void writeToParcel(Parcel dest, int flags) {
                dest.writeString(order_goods_id);
                dest.writeString(goods_id);
                dest.writeString(goods_name);
                dest.writeString(goods_price);
                dest.writeString(total_num);
                dest.writeString(image);
                dest.writeString(goods_attr);
            }
        }
    }
}
