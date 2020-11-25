package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.orderList
import com.ds.worldfunclub.app.orderListLive
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.activity.order.PaySuccessActivity
import com.ds.worldfunclub.ui.delegate.YouLikeDelegate
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/11/3 10:10
 */
@ActivityScope
class PaySuccessModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    val adapter = MultiTypeAdapter<MainSeckill>()

    init {
        adapter.addDelegate(YouLikeDelegate())
        adapter.addData2(arrayListOf(MainSeckill(), MainSeckill()))
    }

    fun activity(): PaySuccessActivity {
        return activity as PaySuccessActivity
    }

    fun order(orderType: String) {
        if (GoodsType.values(orderType) == GoodsType.Self) {
            ARouter.getInstance().build(orderList).withString("state", 2.toString()).navigation(activity)
        } else {
            ARouter.getInstance().build(orderListLive).withString("state", 1.toString()).navigation(activity)
        }
        activity.finish()
    }

    fun home() {
//        ARouter.getInstance().build(main).navigation(activity)
    }
}