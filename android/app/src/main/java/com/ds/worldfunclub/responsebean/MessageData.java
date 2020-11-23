package com.ds.worldfunclub.responsebean;

public class MessageData {


    private String name;
    private String type;
    private String content;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIcon() {
        return icon;
    }

    public void setIcon(int icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MessageData(String name, String type, String content, String title, int icon) {
        this.name = name;
        this.type = type;
        this.content = content;
        this.title = title;
        this.icon = icon;
    }

    private String title;
    private int icon;


}
