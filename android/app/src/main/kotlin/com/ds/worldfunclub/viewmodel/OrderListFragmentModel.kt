package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import androidx.lifecycle.rxLifeScope
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.OrderState
import com.ds.worldfunclub.responsebean.OrderList
import com.ds.worldfunclub.ui.adapter.OrderAdapter
import com.ds.worldfunclub.ui.delegate.OrderStateWillPay
import com.ds.worldfunclub.ui.delegate.OrderStateWillPingjia
import com.ds.worldfunclub.ui.delegate.OrderStateWillReceive
import com.ds.worldfunclub.ui.delegate.OrderStateWillSend
import com.ds.worldfunclub.ui.fragment.OrderListFragment
import kotlinx.android.synthetic.main.activity_order_list.*
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/26 15:59
 */
@FragmentScope
class OrderListFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireActivity()) {
    @get:Bindable
    var adapter = MultiTypeAdapter<OrderList.DataBean>()
    var pos = 0


    override fun onReady() {
        super.onReady()
        adapter.clear()
        this.pos=target().pos
        val self=target().source ==1
        val  pos=if(target().source ==1 ){
            pos
        }else{
            pos+1
        }
        when (pos) {
            0 -> {
                adapter.addDelegate(OrderStateWillPay(source = self))
                adapter.addDelegate(OrderStateWillSend(source = self))
                adapter.addDelegate(OrderStateWillReceive(source = self))
                adapter.addDelegate(OrderStateWillPingjia(source = self))
            }
            1 -> {
                adapter.addDelegate(OrderStateWillPay(source = self))
            }
            2 -> {
                adapter.addDelegate(OrderStateWillSend(source = self))
            }
            3 -> {
                adapter.addDelegate(OrderStateWillReceive(source = self))
            }
            4 -> {
                adapter.addDelegate(OrderStateWillPingjia(source = self))
            }
        }
        loadList()

    }

    fun target():OrderListFragment{
        return  activity as OrderListFragment
    }

    fun loadList() {
        if (app.wxInfo == null) {
            toast()
        } else {
            rxLifeScope.launch {

                val data  =    if (target().source ==1 ){
                    api.getUserOrderList(
                        app.wxInfo!!.user_id,
                        app.wxInfo!!.login_token,
                        page,
                        OrderState.valueOf(pos)
                    )
                }else{
                    api.getUserOrderLiveList(
                        app.wxInfo!!.user_id,
                        app.wxInfo!!.login_token,
                        page,
                        OrderState.fromLive(pos)
                    )
                }

                canLoad= if (data.code == 1) {
                    adapter.addData2(ArrayList(data.data))
                    data.data.size >0
                } else {
                    toast(data)
                    false
                }
                mr?.isRefreshing=false
            }
        }
    }


    override fun loadMore() {
        super.loadMore()
        loadList()
    }

    override fun refresh(r: SwipeRefreshLayout) {
        super.refresh(r)
        adapter.clear( )
        loadList()
    }

}