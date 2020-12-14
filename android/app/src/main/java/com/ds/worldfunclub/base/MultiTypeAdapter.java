package com.ds.worldfunclub.base;

import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.Iterator;

public class MultiTypeAdapter<T> extends RecyclerView.Adapter<RecyclerView.ViewHolder> {

    private String name= "";

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    protected ArrayList<IDelegateAdapter<T>> delegates = new ArrayList<>();
    private boolean footerEnabled = false;

    public boolean isFooterEnabled() {
        return footerEnabled;
    }

    public void setFooterEnabled(boolean footerEnabled) {
        this.footerEnabled = footerEnabled;
    }

    public ArrayList<T> data = new ArrayList<T>();

    public ArrayList<T> getData() {
        return data;
    }

    public void setData(ArrayList<T> data) {
        this.data.clear();
        this.data.addAll(data);
        notifyItemChanged(0);
//        notifyDataSetChanged()
//        notifyItemRangeInserted(0, this.data.size)
    }

    public void addDelegate(IDelegateAdapter<T> delegate) {
        delegates.add(delegate);
    }

    public IDelegateAdapter<T> getPosition(int pos) {
        return delegates.get(pos);
    }

    public int realSize() {
        if (footerEnabled) return data.size() + 1;
        else return data.size();
    }

    public int getItemViewType(int position) {
        if (position >= data.size()) {
            for (IDelegateAdapter<T> d : delegates) {
                if (d.isForViewType(null)) {
                    return delegates.indexOf(d);
                }
            }

        } else {
            T item = data.get(position);
            for (IDelegateAdapter<T> d : delegates) {
                if (d.isForViewType(item)) {
                    return delegates.indexOf(d);
                }
            }
        }
        /*
         * 在规则内出现错误数据我有理由移除你
         */
//        notifyItemRemoved(position);

//        Log.e("没有找到可以处理的委托Adapter:",""+name+"\n"+new Gson().toJson(data.get(position)),new RuntimeException("没有找到可以处理的委托Adapter: "+name+"\n"+new Gson().toJson(data.get(position))));
//        return getItemViewType(position);
//
//
//
//        for ( IDelegateAdapter<T> idr:delegates) {
//            if(idr instanceof  DefalutErrorTypeDelegate){
//              return delegates.indexOf(idr);
//            }
//        }
        throw new RuntimeException("没有找到可以处理的委托Adapter: "+name+"\n"+new Gson().toJson(data.get(position)));
    }

    public void addData(ArrayList<T> data) {
        if (!data.isEmpty()) {
            this.data.addAll(data);
            notifyDataSetChanged();
        }

    }

    public void addData2(ArrayList<T> data) {

        int size = this.data.size();
        if (!data.isEmpty()) {
            this.data.addAll(data);
            int size1 = data.size();
            notifyItemRangeInserted(size, size1);
        }
    }

    public void deleteData(int pos) {
        data.remove(pos);
        notifyItemRemoved(pos);
    }

    public void clear2() {
        data.clear();
        notifyDataSetChanged();
    }

    public void clear() {
        int size = data.size();
        data.clear();
        notifyItemRangeRemoved(0, size);
    }

    public void setData2(ArrayList<T> data) {
        if (data != null) {
            this.data = data;
            notifyDataSetChanged();
        }
    }

    @NonNull
    @Override
    public RecyclerView.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return delegates.get(viewType).onCreateViewHolder(parent, viewType);
    }

    @Override
    public void onBindViewHolder(@NonNull RecyclerView.ViewHolder holder, int position) {
        if (footerEnabled) {
            if (position >= data.size()) {
                delegates.get(holder.getItemViewType()).onBindViewHolder(
                        holder,
                        position,
                        null,
                        data.size() - 1
                );
            } else {
                delegates.get(holder.getItemViewType()).onBindViewHolder(
                        holder,
                        position,
                        data.get(position),
                        data.size() - 1
                );
            }
        } else
            delegates.get(holder.getItemViewType()).onBindViewHolder(
                    holder,
                    position,
                    data.get(position),
                    data.size() - 1
            );
    }

    @Override
    public int getItemCount() {
        if (footerEnabled) return data.size() + 1;
        else return data.size();
    }

}