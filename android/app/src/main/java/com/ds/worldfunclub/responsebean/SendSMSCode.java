package com.ds.worldfunclub.responsebean;

public class SendSMSCode  extends BaseResponse{
    /**
     * returnCD : 1
     * message : 成功!
     * data : 发送成功
     */


    private String data;

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

}
