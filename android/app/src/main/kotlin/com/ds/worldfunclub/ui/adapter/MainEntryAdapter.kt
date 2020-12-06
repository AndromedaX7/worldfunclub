package com.ds.worldfunclub.ui.adapter

import android.util.Log
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.responsebean.HomeCategory
import com.ds.worldfunclub.ui.delegate.MainEntryDelegate

class MainEntryAdapter : MultiTypeAdapter<ArrayList<HomeCategory.DataBean.ChildBean>>() {


    private var dataCount = 0
    fun dataCount(): Int {
        return dataCount
    }

    var adapters = ArrayList<MultiTypeAdapter<HomeCategory.DataBean.ChildBean>>()

    init {
        addDelegate(MainEntryPageDelegate(this))
    }

    private fun splitData(data: ArrayList<HomeCategory.DataBean.ChildBean>): ArrayList<ArrayList<HomeCategory.DataBean.ChildBean>> {
        dataCount = data.size

        val extraSize = dataCount % 15
        var pageSize = dataCount / 15
        Log.e("Size is", " extraSize:$extraSize pageSize:$pageSize")
        val pageData = ArrayList<ArrayList<HomeCategory.DataBean.ChildBean>>()
        for (i in 0 until pageSize) {
            val item = ArrayList<HomeCategory.DataBean.ChildBean>()
            for (j in 0..14) {
                var d = i * 15 + j
                Log.e("data item =", "${d}")

                item.add(data[d])
            }
            pageData.add(item)
        }

        val pageStart = pageSize * 15
        if (extraSize > 0) {
            val item = ArrayList<HomeCategory.DataBean.ChildBean>()
            Log.e("extra :", "pageStart: $pageStart exSize:${extraSize}")
            for (i in pageStart until dataCount) {
                Log.e("extra item =", "${i}")
                item.add(data[i])
            }
            pageData.add(item)
        }
        return pageData
    }

    fun setFlowData(data: ArrayList<HomeCategory.DataBean.ChildBean>) {
        adapters.clear()
        this.data.clear()
        this.data.addAll(splitData(data))
        for (i in 0 until this.data.size) {
            adapters.add(MultiTypeAdapter<HomeCategory.DataBean.ChildBean>())
            adapters[i].addDelegate(MainEntryDelegate())
        }
        Log.e("data", this.data.toString())
        notifyDataSetChanged()
    }

    fun append(data: ArrayList<HomeCategory.DataBean.ChildBean>) {
        val merge = ArrayList<HomeCategory.DataBean.ChildBean>()
        this.data.forEach {
            merge.addAll(it)
        }
        merge.addAll(data)
        setFlowData(merge)
    }
}

class MainEntryPageDelegate(val target: MainEntryAdapter) :
        BindingDelegate2<ArrayList<HomeCategory.DataBean.ChildBean>>() {

    override fun isForViewType(item: ArrayList<HomeCategory.DataBean.ChildBean>?): Boolean {
        return true
    }

    override fun onBindViewHolder(
            viewHolder: RecyclerView.ViewHolder?,
            pos: Int,
            item: ArrayList<HomeCategory.DataBean.ChildBean>?,
            dataSize: Int
    ) {
        super.onBindViewHolder(viewHolder, pos, item, dataSize)
        val mainEntries = target.adapters[pos]
        Log.e("create page item ", "position :$pos")
        val vItem: RecyclerView = viewHolder?.itemView as RecyclerView
//        mainEntries.addData2(data[position])
        val mainEntriesManager =
                GridLayoutManager(vItem.context, 5, GridLayoutManager.VERTICAL, false)
        vItem.adapter = mainEntries
        vItem.layoutManager = mainEntriesManager
        mainEntries.setData2(item)
    }

    override fun layoutId(): Int {
        return R.layout.item_entries_wrapper
    }
}