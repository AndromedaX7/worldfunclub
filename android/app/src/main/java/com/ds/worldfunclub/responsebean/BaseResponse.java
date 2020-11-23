package com.ds.worldfunclub.responsebean;

public class BaseResponse {
    private int code;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    private String msg;

    public String getMessage() {
        return msg;
    }

    public void setMessage(String message) {
        this.msg = message;
    }

    public String toastMsg() {
        return msg;
    }
}
