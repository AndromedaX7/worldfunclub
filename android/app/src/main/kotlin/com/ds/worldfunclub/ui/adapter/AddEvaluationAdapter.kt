package com.ds.worldfunclub.ui.adapter

import android.view.View
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.viewmodel.EvaluationModel
import java.io.File

class AddEvaluationAdapter(val model: EvaluationModel) : MultiTypeAdapter<FileWrapper>() {
    init {
        addDelegate(AddEvaluationDelegate(this))
        addDelegate(DefaultEmptyDelegate(model))
    }

    fun comment(): List<File> {
        val data = ArrayList(this.data)
        val iterator = data.iterator()
        while (iterator.hasNext()) {
            val next = iterator.next()
            if (next.empty) {
                iterator.remove()
            }
        }
        return data.map { it.file }

    }
}


class AddEvaluationDelegate(val adapter: AddEvaluationAdapter) : BindingDelegate2<FileWrapper>() {
    override fun layoutId(): Int {
        return R.layout.item_evaluation
    }

    override fun isForViewType(item: FileWrapper?): Boolean {
        return item != null && !item.empty
    }

    fun deleteCurrent(data: FileWrapper) {
        val idx = adapter.data.indexOf(data)
        adapter.data.remove(data)
        adapter.notifyItemRemoved(idx)
    }
}

class DefaultEmptyDelegate(val model: EvaluationModel) : BindingDelegate2<FileWrapper>() {
    override fun isForViewType(item: FileWrapper?): Boolean {
        return item != null && item.empty
    }

    override fun layoutId(): Int {
        return R.layout.item_evaluation_empty
    }

    fun onTap(v: View) {
        model.selectPhoto()
    }
}

data class FileWrapper(val file: File, val empty: Boolean)