package com.ds.worldfunclub.base;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;
import androidx.recyclerview.widget.RecyclerView;

import com.ds.worldfunclub.BR;


public abstract class BindingDelegate2<T> implements IDelegateAdapter<T> {

    @Override
    public boolean isForViewType(T item) {
        return true;
    }

    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int itemType) {
        LayoutInflater inflater = LayoutInflater.from(viewGroup.getContext());
        ViewDataBinding binding = DataBindingUtil.inflate(inflater, layoutId(), viewGroup, false);
        return new RecyclerBindingViewHolder(binding);
    }

    @Override
    public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int pos, T item, int dataSize) {
        RecyclerBindingViewHolder vh = (RecyclerBindingViewHolder) viewHolder;
        vh.binding.setVariable(BR.vm, this);
        vh.binding.setVariable(BR.data, item);
        vh.binding.setVariable(BR.pos, pos);
        vh.binding.setVariable(BR.max, dataSize);
    }

    public abstract int layoutId();


    public static class RecyclerBindingViewHolder extends
            RecyclerView.ViewHolder {
        public ViewDataBinding binding;

        public RecyclerBindingViewHolder(@NonNull ViewDataBinding binding) {
            super(binding.getRoot());
            this.binding = binding;
        }
    }

}

