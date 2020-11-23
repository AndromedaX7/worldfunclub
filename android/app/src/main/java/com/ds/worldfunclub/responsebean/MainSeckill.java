package com.ds.worldfunclub.responsebean;

import com.ds.worldfunclub.R;

public class MainSeckill {

    private int imgRes = R.mipmap.banner2;
    private String name = "1111";
    private String price = "199";
    private String originPrice = "380";
    private String zPrice = "5";
    private String startTime;

    public int getImgRes() {
        return imgRes;
    }

    public void setImgRes(int imgRes) {
        this.imgRes = imgRes;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getOriginPrice() {
        return originPrice;
    }

    public void setOriginPrice(String originPrice) {
        this.originPrice = originPrice;
    }

    public String getzPrice() {
        return zPrice;
    }

    public void setzPrice(String zPrice) {
        this.zPrice = zPrice;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getSale() {
        return sale;
    }

    public void setSale(int sale) {
        this.sale = sale;
    }

    private int total;
    private int sale;

}
