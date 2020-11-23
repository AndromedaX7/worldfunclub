package com.ds.worldfunclub.responsebean;

import com.ds.worldfunclub.room.LoginInfoEntry;

public class LoginInfo extends BaseResponse {
    /**
     * returnCD : 1
     * message : 成功!
     * data : {"user_center_id":"3","nickname":"橘子是胖胖猪","avatar":"http://thirdwx.qlogo.cn/mmopen/vi_32/r26EqnO7icYZFNb0HKicuylQldR8iaHXwiby2uJapN8VORUkRa0gcGnIQhvdM95MgopkQzJk950CtdaxS1icB2aVHXQ/132","login_token":"64f2da0bbc00002d73ccc7d8cab7d1d51e3546d3","user_mobilebind":"0"}
     */
    private LoginInfoEntry data;


    public LoginInfoEntry getData() {
        return data;
    }

    public void setData(LoginInfoEntry data) {
        this.data = data;
    }

}
