package com.ds.worldfunclub.base

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.databinding.Bindable
import androidx.databinding.Observable
import androidx.databinding.PropertyChangeRegistry
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.login
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.BaseResponse
import com.ds.worldfunclub.ui.activity.login.LoginActivity
import java.util.*

open class BaseModel(val context: Context) : Observable, ViewModel() {
    var mr: SwipeRefreshLayout? = null
    var loadStateProp: () -> Boolean = this::loadState
    var loadMoreProp: () -> Unit = this::loadMore
    var page = 1
    var canLoad = false

    @get:Bindable
    var style: GlobalStyle = GlobalStyle.Default
        set(value) {
            field = value
            notifyPropertyChanged(BR.style)
        }


    private val permissionFunMap: HashMap<Int, () -> Unit> = HashMap()
    private val permissionStrMap = HashMap<Int, String>()


    open fun onResume() {

    }

    @Transient
    var mCallbacks: PropertyChangeRegistry? = null
    override fun addOnPropertyChangedCallback(callback: Observable.OnPropertyChangedCallback) {
        synchronized(this) {
            if (mCallbacks == null) {
                mCallbacks = PropertyChangeRegistry()
            }
        }
        mCallbacks!!.add(callback)
    }

    override fun removeOnPropertyChangedCallback(callback: Observable.OnPropertyChangedCallback) {
        synchronized(this) {
            if (mCallbacks == null) {
                return
            }
        }
        mCallbacks!!.remove(callback)
    }

    /**
     * Notifies listeners that all properties of this instance have changed.
     */
    fun notifyChange() {
        synchronized(this) {
            if (mCallbacks == null) {
                return
            }
        }
        mCallbacks!!.notifyCallbacks(this, 0, null)
    }

    /**
     * Notifies listeners that a specific property has changed. The getter for the property
     * that changes should be marked with [Bindable] to generate a field in
     * `BR` to be used as `fieldId`.
     *
     * @param fieldId The generated BR id for the Bindable field.
     */
    fun notifyPropertyChanged(fieldId: Int) {
        synchronized(this) {
            if (mCallbacks == null) {
                return
            }
        }
        mCallbacks!!.notifyCallbacks(this, fieldId, null)
    }

    open fun onReady() {}


    open fun willSearch(): BaseModel {
        page = 1
        return this
    }

    open fun loadMore() {
        page++
        showInd()
    }

    fun loadState(): Boolean {
        if (!canLoad) {
            page = 1
        }
        return canLoad
    }

    fun showInd() {
        mr?.let {
            it.isRefreshing = true
        }
    }

    fun dismissInd() {
        mr?.isRefreshing = false
    }


    open fun reqPermission(
            permission: String,
            reqcode: Int,
            success: () -> Unit
    ) {
        if (ContextCompat.checkSelfPermission(
                        context,
                        permission
                ) == PackageManager.PERMISSION_GRANTED
        ) {
            success()
        } else {
            permissionFunMap[reqcode] = success
            permissionStrMap[reqcode] = permission
            ActivityCompat.requestPermissions(
                    (context as Activity?)!!,
                    arrayOf(permission),
                    reqcode
            )
        }
    }

    open fun activity(activity: AppCompatActivity): AppCompatActivity {
        return activity
    }

    open fun reqPermission(
            fragment: Fragment,
            permission: String,
            reqcode: Int,
            success: () -> Unit
    ) {
        if (ContextCompat.checkSelfPermission(
                        context,
                        permission
                ) == PackageManager.PERMISSION_GRANTED
        ) {
            success()
        } else {
            permissionFunMap.put(reqcode, success)
            permissionStrMap.put(reqcode, permission)
            fragment.requestPermissions(arrayOf(permission), reqcode)
        }
    }

    open fun onRequestPermissionsResult(
            requestCode: Int,
            permissions: Array<String>,
            grantResults: IntArray
    ) {
        for (req in permissionFunMap.keys) {
            if (req == requestCode && permissions[0] == permissionStrMap.get(req)) {
                if (grantResults[0] == PackageManager.PERMISSION_GRANTED) {

                    permissionFunMap[req]?.invoke()

                } else {
                    context.toast("权限不足,请到系统设置开启")
                }
            }
        }
    }

    open fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {}


    open fun refresh(r: SwipeRefreshLayout) {
        if (mr == null) {
            mr = r
        }

        mr?.isRefreshing = true
        mr?.postDelayed({ mr?.isRefreshing = false }, 15000)
        willSearch()
    }

    fun toast(msg: String) {
        context.toast(msg)

    }

    fun toast() {

        val baseResponse = BaseResponse()
        baseResponse.message = "登录过期"
        baseResponse.code = -99
        toast(baseResponse)

    }

    fun toast(bean: BaseResponse) {
        context.toast(bean.toastMsg())
        if (bean.code == -99) {
            ARouter.getInstance().build(login)
                    .withInt(LoginActivity.key_option, LoginActivity.option_unused_back).navigation()
        }
    }
}


class ViewModelFactory2(val owner: AppCompatActivity, val app: App, val api: Api) :
        ViewModelProvider.Factory {
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return modelClass.getConstructor(
                AppCompatActivity::class.java,
                App::class.java,
                Api::class.java
        ).newInstance(owner, app, api)
    }
}

class ViewModelFactory3(val owner: Fragment, val app: App, val api: Api) :
        ViewModelProvider.Factory {
    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        return modelClass.getConstructor(
                Fragment::class.java,
                App::class.java,
                Api::class.java
        ).newInstance(owner, app, api)
    }
}