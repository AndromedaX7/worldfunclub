package com.ds.worldfunclub.responsebean;

import android.content.Context;

import com.google.gson.Gson;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class AddressAreaWrap{
    private List<AddressArea> data;

    public List<AddressArea> getData() {
        return data;
    }

    public void setData(List<AddressArea> data) {
        this.data = data;
    }

    public static AddressAreaWrap fromAssets(Context context) {
        try {
            InputStream is = context.getAssets().open("area.json");
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            int l = -1;
            while ((l = is.read()) != -1) {
                out.write(l);
            }
            is.close();
            return new Gson().fromJson(out.toString(),AddressAreaWrap.class );
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}