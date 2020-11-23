package com.ds.worldfunclub

import android.app.Activity
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import androidx.core.util.Pair
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import cn.sharesdk.onekeyshare.OnekeyShare
import com.ds.worldfunclub.databinding.ViewFlowSearchItemBinding
import com.ds.worldfunclub.widget.FlowLayout

class StaticComponent {
    fun createHistoryFlowItem(flowLayout: FlowLayout, data: String) {
        val binding: ViewFlowSearchItemBinding = DataBindingUtil.inflate(
            LayoutInflater.from(flowLayout.context),
            R.layout.view_flow_search_item,
            null,
            false
        )
        binding.data = data
        flowLayout.addView(binding.root)
    }


}


fun Activity.pair(view: View, string: Int): Pair<View, String> {
    return Pair<View, String>(view, view.context.getString(string))
}

fun Fragment.pair(view: View, string: Int): Pair<View, String> {
    return Pair<View, String>(view, view.context.getString(string))
}

fun Activity.pair(view: View, string: String): Pair<View, String> {
    return Pair<View, String>(view, string)
}

fun Fragment.pair(view: View, string: String): Pair<View, String> {
    return Pair<View, String>(view, string)
}


fun OnekeyShare.sharedAndShow(
    context: Context,
    contentUrl: String?,
    imageUrl: String?,
    sharedText: String,
    title: String
) {

    // title标题，微信、QQ和QQ空间等平台使用
    setTitle(title)
    // titleUrl QQ和QQ空间跳转链接
    // url在微信、Facebook等平台中使用
    contentUrl?.let {
        setTitleUrl(it)
        setUrl(it)
    }
    // text是分享文本，所有平台都需要这个字段
    text = sharedText
    // setImageUrl是网络图片的url
    imageUrl?.let {
        setImageUrl(it)
    }
    show(context)
}

