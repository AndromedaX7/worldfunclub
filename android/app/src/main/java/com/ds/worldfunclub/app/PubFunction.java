package com.ds.worldfunclub.app;

public class PubFunction {

    public static boolean and(boolean a, boolean b) {
        return a && b;
    }

    public static int toInt (String intString){
        try{
          return   Integer.parseInt(intString);
        }catch (NumberFormatException e){
            return  0;
        }
    }

    public static boolean xy (int a,int b){
        return a< b;
    }
}
