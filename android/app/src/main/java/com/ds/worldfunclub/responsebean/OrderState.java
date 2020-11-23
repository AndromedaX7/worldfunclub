package com.ds.worldfunclub.responsebean;

import java.util.ArrayList;

public class OrderState {

    private int state ;

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public ArrayList<MainSeckill> getGoods() {
        return goods;
    }

    public void setGoods(ArrayList<MainSeckill> goods) {
        this.goods = goods;
    }

    public OrderState(ArrayList<MainSeckill> goods) {
        this.goods = goods;
    }

    public OrderState(int state, String shop, String total, ArrayList<MainSeckill> goods) {
        this.state = state;
        this.shop = shop;
        this.total = total;
        this.goods = goods;
    }

    private String shop;
    private String total;

    private ArrayList<MainSeckill> goods;


}
