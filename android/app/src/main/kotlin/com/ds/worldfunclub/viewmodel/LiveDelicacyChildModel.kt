package com.ds.worldfunclub.viewmodel

import android.view.LayoutInflater
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.databinding.DataBindingUtil
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.databinding.ViewCategroyDoubleRecyclerview2Binding
import com.ds.worldfunclub.databinding.ViewCategroyDoubleRecyclerviewBinding
import com.ds.worldfunclub.databinding.ViewCategroyRecyclerviewBinding
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.delegate.CategoryTextDelegate
import com.ds.worldfunclub.ui.delegate.CategoryTextDelegate2
import com.ds.worldfunclub.widget.DropDownManager
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/7/28 上午10:10
 */
@ActivityScope
class LiveDelicacyChildModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    var cat0 = false

    @get:Bindable
    val adapter = MultiTypeAdapter<String>()


    @get:Bindable
    val adapter2 = MultiTypeAdapter<String>()

    @get:Bindable
    val adapter3 = MultiTypeAdapter<String>()

    init {
        adapter.addDelegate(CategoryTextDelegate())
        adapter.addData2(arrayListOf("1", "1", "1", "1", "1", "1", "1", "1"))

        adapter2.addDelegate(CategoryTextDelegate())
        adapter2.addData2(arrayListOf("2", "2", "2", "2"))

        adapter3.addDelegate(CategoryTextDelegate2())
        adapter3.addData2(arrayListOf("2", "2", "2", "2"))
    }

    fun selectCategory(v: View) {

        val dropViewContent = DataBindingUtil.inflate<ViewCategroyRecyclerviewBinding>(
            LayoutInflater.from(v.context),
            R.layout.view_categroy_recyclerview,
            null,
            false
        )
        dropViewContent.adapter = adapter

        DropDownManager.attachView(
            v,
            DropDownManager.genSelectList(v.context, dropViewContent.root)
        )


    }

    fun selectCategory2(v: View) {

        val dropViewContent = DataBindingUtil.inflate<ViewCategroyRecyclerviewBinding>(
            LayoutInflater.from(v.context),
            R.layout.view_categroy_recyclerview,
            null,
            false
        )
        dropViewContent.adapter = adapter3

        DropDownManager.attachView(
            v,
            DropDownManager.genSelectList(v.context, dropViewContent.root)
        )


    }

    fun selectCategory3(v: View) {

        val dropViewContent = DataBindingUtil.inflate<ViewCategroyDoubleRecyclerviewBinding>(
            LayoutInflater.from(v.context),
            R.layout.view_categroy_double_recyclerview,
            null,
            false
        )
        dropViewContent.adapter = adapter2
        dropViewContent.adapter2 = adapter

        DropDownManager.attachView(
            v,
            DropDownManager.genSelectList(v.context, dropViewContent.root)
        )


    }

    fun selectCategory4(v: View) {

        val dropViewContent = DataBindingUtil.inflate<ViewCategroyDoubleRecyclerview2Binding>(
            LayoutInflater.from(v.context),
            R.layout.view_categroy_double_recyclerview2,
            null,
            false
        )
        dropViewContent.adapter = adapter2
        dropViewContent.adapter2 = adapter

        DropDownManager.attachView(
            v,
            DropDownManager.genSelectList(v.context, dropViewContent.root)
        )


    }

}
