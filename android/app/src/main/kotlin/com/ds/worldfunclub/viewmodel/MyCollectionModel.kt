package com.ds.worldfunclub.viewmodel

import android.content.DialogInterface
import android.graphics.Color
import android.util.Log
import android.view.ViewGroup
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.DataBindingAdapter
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.CollectListBean
import com.ds.worldfunclub.ui.delegate.MyCollectionDelegate
import com.ds.worldfunclub.ui.dialog.AlertDialog
import com.yanzhenjie.recyclerview.SwipeMenuItem
import com.yanzhenjie.recyclerview.SwipeRecyclerView
import kotlinx.android.synthetic.main.activity_my_collection.*
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/22 下午12:08
 */
@ActivityScope
class MyCollectionModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity), LifecycleObserver {

    @get:Bindable
    val adapter = MultiTypeAdapter<CollectListBean.DataBean>()

    init {
        activity.lifecycle.addObserver(this)
        adapter.addDelegate(MyCollectionDelegate())

    }

    private fun loadList() {
        if (app.wxInfo != null) {
            rxLifeScope.launch {
                val data = api.getCollectList(app.wxInfo!!.user_id, app.wxInfo!!.login_token, page)
                if (data.code == 1) {
                    adapter.addData2(ArrayList(data.data))
                }
            }
        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_CREATE)
    fun onCreated() {
        val list: SwipeRecyclerView = activity.list
        list.setSwipeMenuCreator { _, rightMenu, _ ->
            val deleteMenu = SwipeMenuItem(activity)
            deleteMenu.width = DataBindingAdapter.dp2px(activity, 75)
            deleteMenu.height = ViewGroup.LayoutParams.MATCH_PARENT
            deleteMenu.text = "删除"
            deleteMenu.setTextColor(Color.WHITE)
            deleteMenu.setBackgroundColor(Color.parseColor("#FF354D"))
            rightMenu.addMenuItem(deleteMenu)
        }

        list.setOnItemMenuClickListener { menuBridge, adapterPosition ->
            Log.e("onItemMenu", "$adapterPosition")
            menuBridge.closeMenu()
            val dialog = AlertDialog(activity)
            dialog.setTitle("确定要删除收藏的商品吗？")
            dialog.setOnOption2Click("删除", Color.parseColor("#FF354D"),
                DialogInterface.OnClickListener { _, _ ->
                    rxLifeScope.launch {
                        if (app.wxInfo != null) {
                            val data = api.deleteCollect(
                                app.wxInfo!!.user_id,
                                app.wxInfo!!.login_token,
                                adapter.data[adapterPosition].collect_id
                            )
                            if (data.code == 1) {
                                adapter.deleteData(adapterPosition)
                            } else {
                                toast(data)
                            }
                        }

                    }

                })
                .withCancel(Color.parseColor("#007aff"))
                .show()

        }
    }

    @OnLifecycleEvent(Lifecycle.Event.ON_DESTROY)
    fun onDestroyed() {
        activity.lifecycle.removeObserver(this)
    }

    override fun onResume() {
        super.onResume()
        adapter.clear()
        loadList()
    }

    override fun loadMore() {
        super.loadMore()
        loadList()
    }
}

