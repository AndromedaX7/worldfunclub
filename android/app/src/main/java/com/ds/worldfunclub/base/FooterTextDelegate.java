package com.ds.worldfunclub.base;


import com.ds.worldfunclub.R;


public class FooterTextDelegate <T>extends BindingDelegate2< T>  {

    @Override
    public boolean isForViewType(T item) {
        return item == null;
    }

    @Override
    public int layoutId() {
        return  R.layout.item_bottom_tips;
    }
}
