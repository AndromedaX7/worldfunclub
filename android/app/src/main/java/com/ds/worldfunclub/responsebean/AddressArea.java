package com.ds.worldfunclub.responsebean;

import android.content.Context;

import com.google.gson.Gson;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;


public class AddressArea {

    private String id;
    private String pid;
    private String name;
    private List<AddressArea> children;
    private boolean selected;
    public String getId() {
        return id;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<AddressArea> getChildren() {
        return children;
    }

    public void setChildren(List<AddressArea> children) {
        this.children = children;
    }


}
