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

class ViewModelFactory(val app: AppCompatActivity) : ViewModelProvider.Factory {
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return modelClass.getConstructor(AppCompatActivity::class.java).newInstance(app)
    }
}

fun <VM : BaseModel> AppCompatActivity.createViewModel(vmClass: Class<VM>): VM =
    ViewModelProvider(this, ViewModelFactory(this)).get(vmClass)


fun Activity.transparentStatus() {
    val option = (View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or View.SYSTEM_UI_FLAG_LAYOUT_STABLE)
    window.decorView.systemUiVisibility = option
    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS)
    window.statusBarColor = Color.TRANSPARENT
}


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

fun Activity.toast(text: String) {
    Toast.makeText(this, text, Toast.LENGTH_SHORT).show()
}

fun Activity.toast(text: String, textSize: Float) {
    val toast = Toast.makeText(this, text, Toast.LENGTH_SHORT)
    val linearLayout = toast.view as LinearLayout
    val childAt = linearLayout.getChildAt(0) as TextView
    childAt.textSize = textSize
    toast.show()
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


fun Context.toast() {

    val baseResponse = BaseResponse()
    baseResponse.message = "登录过期"
    baseResponse.code = -99
    toast(baseResponse)

}

fun Context.toast(bean: BaseResponse) {
    toast(bean.toastMsg())
    if (bean.code == -99) {
    }
}

fun Context.toast(text: String) {
    Toast.makeText(this, text, Toast.LENGTH_SHORT).show()
}

fun Context.saveInfo(info: LoginInfoEntry) {
    val sps = getSharedPreferences("sInfo2", Context.MODE_PRIVATE)
    sps.edit().putString("user_id", info.user_id).putString("nickname", info.nickname)
        .putString("avatar", info.avatar)
        .putString("login_token", info.login_token)
        .putString("user_mobilebind", info.user_mobilebind).putString("user_type", info.user_type)
        .apply()
}


fun Context.loadInfo(): LoginInfoEntry {
    val sps = getSharedPreferences("sInfo2", Context.MODE_PRIVATE)
    val entry = LoginInfoEntry()
    entry.user_id = sps.getString("user_id", "") ?: ""
    entry.nickname = sps.getString("nickname", "") ?: ""
    entry.avatar = sps.getString("avatar", "") ?: ""
    entry.login_token = sps.getString("login_token", "") ?: ""
    entry.user_mobilebind = sps.getString("user_mobilebind", "") ?: ""
    entry.user_type = sps.getString("user_type", "") ?: ""
    return entry
}


fun Context.deleteUserInfo() {
    val sps = getSharedPreferences("sInfo2", Context.MODE_PRIVATE)
    sps.edit().putString("user_id", "").putString("nickname", "")
        .putString("avatar", "")
        .putString("login_token", "")
        .putString("user_mobilebind", "").putString("user_type", "")
        .apply()
}

fun Context.saveToken(token: String) {
    Log.e("saveToken", token)
    val sps = getSharedPreferences("sInfo", Context.MODE_PRIVATE)
    sps.edit().putString("token", token).apply()
}


fun Context.getToken(): String {
    val sps = getSharedPreferences("sInfo", Context.MODE_PRIVATE)
    return sps.getString("token", "") ?: ""
}


fun Context.hasToken() = getToken().isNotEmpty()


fun Context.saveRecord(record: String, time: Long) {
    val sps = getSharedPreferences("sInfo", Context.MODE_PRIVATE)
    sps.edit().putString("record", record)
        .putLong("time", time).apply()
}

fun Context.recordName(): String {
    val sps = getSharedPreferences("sInfo", Context.MODE_PRIVATE)
    return sps.getString("record", "") ?: ""
}

fun Context.recordTime(): Long {
    val sps = getSharedPreferences("sInfo", Context.MODE_PRIVATE)
    return sps.getLong("time", 0)
}

fun Context.hasRecord() = recordName().isNotEmpty() && recordTime() != 0L

fun Context.cleanAll() {
    saveToken("")
    saveRecord("", 0)
    deleteUserInfo()
}

fun Context.cleanToken() {
    saveToken("")
}

fun Context.cleanRecord() {
    saveRecord("", 0)
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

fun stringToInt(num: String): Int {
    return num.toInt()
}

fun stringToDouble(num: String): Double {
    return num.toDouble()
}

fun stringToLong(num: String): Long {
    return num.toLong()
}


operator fun String .times (time: String ):Double{
    return this.toDouble() * time.toDouble()
}
//fun toYuan():String{
//    return
//}