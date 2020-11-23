package com.ds.worldfunclub.ui.adapter

import android.view.LayoutInflater
import android.view.View
import androidx.databinding.DataBindingUtil
import androidx.databinding.ViewDataBinding
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.widget.FlowLayout

class FlowAdapter<T>(val flowLayout: FlowLayout, val delegate: BindingDelegate2<T>) {
    var selected =0

    val data = ArrayList<T>()
    val bindings = ArrayList<ViewDataBinding>()
    private fun genViewContent(b: BindingDelegate2<T>, pos: Int) {
        val lId = b.layoutId()
        val binding = DataBindingUtil.inflate<ViewDataBinding>(
            LayoutInflater.from(flowLayout.context),
            lId,
            flowLayout,
            false
        )
        binding.setVariable(BR.vm, delegate)
        binding.setVariable(BR.data, data[pos])
        binding.setVariable(BR.pos, pos)
        binding.setVariable(BR.max, data.size)
        binding.setVariable(BR.selected,selected)
        bindings.add(binding)
        flowLayout.addView(binding.root)
    }


    fun updateOne(pos: Int, data: T) {
        if (pos < this.data.size) {
            this.data[pos] = data
            updatePosition(pos)
        }
    }

    private fun updatePosition(pos: Int) {
        if (pos < this.data.size) {
            bindings[pos].setVariable(BR.selected,selected)
            bindings[pos].setVariable(BR.data, data[pos])
        }
    }


    fun setData(src: ArrayList<T>) {
        selected =0
        val oldSize = this.data.size
        this.data.clear()
        this.data.addAll(src)
        val newSize = data.size

        if (oldSize > newSize) {
            for (i in 0 until newSize) {
                bindings[i].setVariable(BR.data, data[i])
                bindings[i].setVariable(BR.selected,selected)
                bindings[i].root.visibility = View.VISIBLE
            }
            for (i in newSize until oldSize) {
                bindings[i].root.visibility = View.GONE
                bindings[i].setVariable(BR.selected,selected)
            }
        } else if (newSize > oldSize) {
            for (i in 0 until oldSize) {
                bindings[i].setVariable(BR.data, data[i])
                bindings[i].root.visibility = View.VISIBLE
                bindings[i].setVariable(BR.selected,selected)
            }
            for (i in oldSize until newSize) {
                genViewContent(delegate, i)
                bindings[i].root.visibility = View.VISIBLE
                bindings[i].setVariable(BR.selected,selected)
            }
        } else {
            for (i in 0 until newSize) {
                bindings[i].setVariable(BR.data, data[i])
                bindings[i].root.visibility = View.VISIBLE
                bindings[i].setVariable(BR.selected,selected)
            }
        }


    }

    fun clear() {
        val size = data.size
        selected =0
        for (i in 0 until  size){
            bindings[i].root.visibility=View.GONE
            bindings[i].setVariable(BR.selected,selected)
        }
        data.clear()
    }

    fun refresh(pos: Int) {
        selected =pos
        for (b in bindings){
            b.setVariable(BR.selected,selected)
        }
    }

}