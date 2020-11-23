package com.ds.worldfunclub.responsebean;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.List;

public class AddressData extends BaseResponse {


    /**
     * address_id : 15
     * name : 曹东东
     * phone : 13601243046
     * province_id : 110000
     * city_id : 110100
     * region_id : 110101
     * district :
     * detail : 北京市回龙观111
     * user_id : 10014
     * region : {"province":"北京市","city":"北京市","region":"东城区"}
     * is_default : 1
     */

    private List<DataBean> data;

    public List<DataBean> getData() {
        return data;
    }

    public void setData(List<DataBean> data) {
        this.data = data;
    }

    public static class DataBean implements Parcelable {
        private String address_id;
        private String name;
        private String phone;
        private String province_id;
        private String city_id;
        private String region_id;
        private String district;
        private String detail;
        private String user_id;
        /**
         * province : 北京市
         * city : 北京市
         * region : 东城区
         */

        private RegionBean region;
        private String is_default;
        public DataBean(){}
        protected DataBean(Parcel in) {
            address_id = in.readString();
            name = in.readString();
            phone = in.readString();
            province_id = in.readString();
            city_id = in.readString();
            region_id = in.readString();
            district = in.readString();
            detail = in.readString();
            user_id = in.readString();
            region = in.readParcelable(RegionBean.class.getClassLoader());
            is_default = in.readString();
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

        public String getAddress_id() {
            return address_id;
        }

        public void setAddress_id(String address_id) {
            this.address_id = address_id;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPhone() {
            return phone;
        }

        public void setPhone(String phone) {
            this.phone = phone;
        }

        public String getProvince_id() {
            return province_id;
        }

        public void setProvince_id(String province_id) {
            this.province_id = province_id;
        }

        public String getCity_id() {
            return city_id;
        }

        public void setCity_id(String city_id) {
            this.city_id = city_id;
        }

        public String getRegion_id() {
            return region_id;
        }

        public void setRegion_id(String region_id) {
            this.region_id = region_id;
        }

        public String getDistrict() {
            return district;
        }

        public void setDistrict(String district) {
            this.district = district;
        }

        public String getDetail() {
            return detail;
        }

        public void setDetail(String detail) {
            this.detail = detail;
        }

        public String getUser_id() {
            return user_id;
        }

        public void setUser_id(String user_id) {
            this.user_id = user_id;
        }

        public RegionBean getRegion() {
            return region;
        }

        public void setRegion(RegionBean region) {
            this.region = region;
        }

        public String getIs_default() {
            return is_default;
        }

        public void setIs_default(String is_default) {
            this.is_default = is_default;
        }

        @Override
        public int describeContents() {
            return 0;
        }

        @Override
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(address_id);
            dest.writeString(name);
            dest.writeString(phone);
            dest.writeString(province_id);
            dest.writeString(city_id);
            dest.writeString(region_id);
            dest.writeString(district);
            dest.writeString(detail);
            dest.writeString(user_id);
            dest.writeParcelable(region, flags);
            dest.writeString(is_default);
        }

        public static class RegionBean implements Parcelable {
            private String province;
            private String city;
            private String region;

            protected RegionBean(Parcel in) {
                province = in.readString();
                city = in.readString();
                region = in.readString();
            }

            public static final Creator<RegionBean> CREATOR = new Creator<RegionBean>() {
                @Override
                public RegionBean createFromParcel(Parcel in) {
                    return new RegionBean(in);
                }

                @Override
                public RegionBean[] newArray(int size) {
                    return new RegionBean[size];
                }
            };

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

            @Override
            public int describeContents() {
                return 0;
            }

            @Override
            public void writeToParcel(Parcel dest, int flags) {
                dest.writeString(province);
                dest.writeString(city);
                dest.writeString(region);
            }
        }
    }
}
