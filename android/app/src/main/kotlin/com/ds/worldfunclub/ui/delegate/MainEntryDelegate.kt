package com.ds.worldfunclub.ui.delegate

import android.view.View
import android.widget.Toast
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.SharedElementHelper
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.HomeCategory

open class MainEntryDelegate : BindingDelegate2< HomeCategory.DataBean.ChildBean >() {
    override fun layoutId() = R.layout.item_entries



    fun onTap(v: View, data:  HomeCategory.DataBean.ChildBean ) {
        if(data.entryUrl == null || data.entryUrl == "")
            return
        when {
            data.entryUrl.startsWith("/") -> ARouter.getInstance().build(data.entryUrl)
                .withOptionsCompat(SharedElementHelper.newPageTitle(v))
                .withParcelable("category",data)
                .navigation(v.context)
            data.entryUrl.startsWith("http") -> Toast.makeText(
                v.context,
                "open web page :${data.entryUrl}",
                Toast.LENGTH_SHORT
            ).show()
            else ->
                return
        }
    }
}