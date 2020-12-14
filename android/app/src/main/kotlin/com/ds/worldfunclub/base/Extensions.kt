package com.ds.worldfunclub.base

import android.app.Activity
import android.content.Context
import android.graphics.Color
import android.os.Build
import android.util.Log
import android.view.View
import android.view.WindowManager
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.ds.worldfunclub.responsebean.BaseResponse
import com.ds.worldfunclub.room.LoginInfoEntry


fun isLightColor(color: Int): Boolean {
    val r = (color shr 16) and 0xff
    val g = (color shr 8) and 0xff
    val b = color and 0xff
    return r * 0.299 + g * 0.587 + b * 0.114 >= 192
}

fun Activity.transparentStatus(colorRes: Int) {
    var option = (View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
        if (isLightColor(colorRes)) {
            option = (option or View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR)
        }
    }
    window.decorView.systemUiVisibility = option
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
        window.statusBarColor = Color.TRANSPARENT
    }
}


fun RecyclerView.loadMore(canLoad: (() -> Boolean), loadMore: (() -> Unit)) {
    this.addOnScrollListener(object : RecyclerView.OnScrollListener() {
        override fun onScrollStateChanged(recyclerView: RecyclerView, newState: Int) {
            recyclerView.adapter?.let {
                if (layoutManager is LinearLayoutManager) {
                    val lm = layoutManager as LinearLayoutManager
                    val totalItemCount = it.itemCount
                    val lastVisible = lm.findLastVisibleItemPosition()
                    val visibleCount = childCount

                    if (newState == RecyclerView.SCROLL_STATE_IDLE && lastVisible == totalItemCount - 1 && visibleCount > 0) {
                        if (canLoad()) {
                            loadMore()
                        }
                    }
                }

            }


        }


    })
}



fun Context.toast(bean: BaseResponse) {
    toast(bean.toastMsg())
    if (bean.code == -99) {
    }
}

fun Context.toast(text: String) {
    Toast.makeText(this, text, Toast.LENGTH_SHORT).show()
}


fun Number.toYuan(): String {
    val src = toString()
    val spl = src.split(".")
    if (spl.isEmpty()) {
        return "$src.00"
    } else {
        return when (spl.size) {
            1 -> {
                "${spl[0]}.00"
            }
            2 -> {
                val yuan = if (spl[1].length >= 2) {
                    val jf = spl[1].substring(0..1)
                    "${spl[0]}.$jf"
                } else if (spl[1].length == 1) {
                    "${spl[0]}.${spl[1]}0"
                } else {
                    "${spl[0]}.00"
                }
                yuan

            }
            else -> {
                "0.00"
            }
        }
    }
}

fun stringToDouble(num: String): Double {
    return num.toDouble()
}

operator fun String .times (time: String ):Double{
    return this.toDouble() * time.toDouble()
}
//fun toYuan():String{
//    return
//}