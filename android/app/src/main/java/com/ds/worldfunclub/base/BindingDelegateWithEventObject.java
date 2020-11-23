package com.ds.worldfunclub.base;

import androidx.databinding.ViewDataBinding;
import androidx.recyclerview.widget.RecyclerView;


public abstract class BindingDelegateWithEventObject<T> extends BindingDelegate2<T> {


    public abstract void setVariables(ViewDataBinding dataBinding);

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int pos, T item, int dataSize) {
        super.onBindViewHolder(viewHolder, pos, item, dataSize);
        RecyclerBindingViewHolder vh = (RecyclerBindingViewHolder) viewHolder;
        setVariables(vh.binding);
    }
}

