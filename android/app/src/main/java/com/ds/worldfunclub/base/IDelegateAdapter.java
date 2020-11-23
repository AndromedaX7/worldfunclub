package com.ds.worldfunclub.base;

import android.view.ViewGroup;

import androidx.recyclerview.widget.RecyclerView;

public interface IDelegateAdapter<T> {
    boolean isForViewType(T item);

    RecyclerView.ViewHolder onCreateViewHolder(ViewGroup viewGroup, int itemType);

    void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int pos, T item, int dataSize);
}
