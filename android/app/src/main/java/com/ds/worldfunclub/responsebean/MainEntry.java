package com.ds.worldfunclub.responsebean;

import com.ds.worldfunclub.R;

public class MainEntry {
    private String name="Name";
    private String id ="1";
    private String type="1";
    private int  imgUrl= R.mipmap.group_0;
    private String entryUrl;

    public MainEntry(String name, String id, String type, int imgUrl, String entryUrl) {
        this.name = name;
        this.id = id;
        this.type = type;
        this.imgUrl = imgUrl;
        this.entryUrl = entryUrl;
    }

    public MainEntry() {
    }

    public MainEntry(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(int imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getEntryUrl() {
        return entryUrl;
    }

    public void setEntryUrl(String entryUrl) {
        this.entryUrl = entryUrl;
    }
}
