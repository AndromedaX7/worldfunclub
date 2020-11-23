package com.ds.worldfunclub.responsebean;

import java.util.ArrayList;

public class Pingjia {
    private String userName;

    private String icon;
    private String content;
    private ArrayList<String> imgs;
    private float star;

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Pingjia(String userName, String icon, String content, ArrayList<String> imgs, float star) {
        this.userName = userName;
        this.icon = icon;
        this.content = content;
        this.imgs = imgs;
        this.star = star;
    }

    public float getStar() {
        return star;
    }

    public void setStar(float star) {
        this.star = star;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArrayList<String> getImgs() {
        return imgs;
    }

    public void setImgs(ArrayList<String> imgs) {
        this.imgs = imgs;
    }
}
