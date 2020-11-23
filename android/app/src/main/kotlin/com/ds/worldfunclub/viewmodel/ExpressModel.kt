package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.ExpressBean
import com.ds.worldfunclub.ui.activity.order.ExpressActivity
import com.ds.worldfunclub.ui.delegate.ExpressDelegate
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/11/3 14:13
 */
@ActivityScope
class ExpressModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    @get:Bindable
    val adapter = MultiTypeAdapter<ExpressBean.DataBean.DeliveryListBean>()

    @get:Bindable
    var goodsImage = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsImage)
        }
    @get:Bindable
    var cpy = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.cpy)
        }
    @get:Bindable
    var eno = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.eno)
        }

    init {
        adapter.addDelegate(ExpressDelegate())
    }


    override fun onReady() {
        super.onReady()

        if (app.wxInfo == null) {
            toast()
            return
        }
        rxLifeScope.launch {
            val a = activity as ExpressActivity

            val express = api.express(
                order_id = a.orderId,
                order_goods_id = a.goodsId,
                user_id = app.wxInfo!!.user_id,
                login_token = app.wxInfo!!.login_token
            )
            if (express.code == 1) {
                adapter.clear()
                adapter.addData2(ArrayList(express.data.deliveryList))
                goodsImage=express.data.goods_image
                cpy = express.data.deliveryName
                eno = express.data.deliveryNo
            } else
                toast(express)
        }
    }

}