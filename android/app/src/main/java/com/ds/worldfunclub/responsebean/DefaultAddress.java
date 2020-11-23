package com.ds.worldfunclub.responsebean;

public class DefaultAddress extends  BaseResponse {
    private  AddressData.DataBean data ;

    public AddressData.DataBean getData() {
        return data;
    }

    public void setData(AddressData.DataBean data) {
        this.data = data;
    }
}
