package com.ds.worldfunclub.responsebean;

public class Footpoint {
    private  boolean hide;
    private String date;
    private MainSeckill goods;

    public Footpoint(boolean hide, String date, MainSeckill goods) {
        this.hide = hide;
        this.date = date;
        this.goods = goods;
    }

    public boolean isHide() {
        return hide;
    }

    public void setHide(boolean hide) {
        this.hide = hide;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public MainSeckill getGoods() {
        return goods;
    }

    public void setGoods(MainSeckill goods) {
        this.goods = goods;
    }
}
