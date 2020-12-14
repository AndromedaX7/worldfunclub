package com.ds.worldfunclub.room;


public class LoginInfoEntry {


    private String user_id="";
    private String nickname;
    private String avatar;
    private String login_token;
    private String user_mobilebind;
    private String user_type;


    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(  String user_id) {
        this.user_id = user_id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getLogin_token() {
        return login_token;
    }

    public void setLogin_token(String login_token) {
        this.login_token = login_token;
    }

    public String getUser_mobilebind() {
        return user_mobilebind;
    }

    public void setUser_mobilebind(String user_mobilebind) {
        this.user_mobilebind = user_mobilebind;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    @Override
    public String toString() {
        return "LoginInfoEntry{" +
                "user_id='" + user_id + '\'' +
                ", nickname='" + nickname + '\'' +
                ", avatar='" + avatar + '\'' +
                ", login_token='" + login_token + '\'' +
                ", user_mobilebind='" + user_mobilebind + '\'' +
                '}';
    }
}
