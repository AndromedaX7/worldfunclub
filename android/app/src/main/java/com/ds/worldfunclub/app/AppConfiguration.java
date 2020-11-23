package com.ds.worldfunclub.app;

import com.ds.worldfunclub.ui.activity.MainActivity;
import com.ds.worldfunclub.ui.activity.SearchActivity;
import com.ds.worldfunclub.ui.activity.SplashActivity;
import com.ds.worldfunclub.ui.activity.live.hotel.HotelSearchActivity;
import com.ds.worldfunclub.ui.activity.login.BindPhoneActivity;
import com.ds.worldfunclub.ui.activity.login.LoginActivity;
import com.ds.worldfunclub.ui.activity.login.LoginPhoneActivity;
import com.ds.worldfunclub.ui.activity.order.OrderSearchActivity;

import java.util.ArrayList;

public class AppConfiguration {
    public static ArrayList<String > ignoreClass =new ArrayList<>();


    public  static long USE_RECORD_TIME=60*60*1000;
    static {
        ignoreClass.add(SplashActivity.class.getName());
        ignoreClass.add(LoginActivity.class.getName());
        ignoreClass.add(LoginPhoneActivity.class.getName());
        ignoreClass.add(BindPhoneActivity.class.getName());
        ignoreClass.add(MainActivity.class.getName());
        ignoreClass.add(OrderSearchActivity.class.getName());
        ignoreClass.add(SearchActivity.class.getName());
        ignoreClass.add(HotelSearchActivity.class.getName());
    }
}
