package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.responsebean.WithdrawBean
import com.ds.worldfunclub.ui.delegate.WithdrawRecodeDelegate
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午4:46
 */
@ActivityScope
class WithdrawRecordModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    val adapter = MultiTypeAdapter<WithdrawBean.DataBean>()

    init {
        adapter.addDelegate(WithdrawRecodeDelegate())
        withdrawList();
    }

    fun withdrawList(){
        if(app.wxInfo == null){
            toast();
            return
        }
        rxLifeScope.launch {
            val withdrawList = api.withdrawList(app.wxInfo!!.user_id, page)
            if(withdrawList.code == 1){
                adapter.addData2(ArrayList(withdrawList.data))
            }
        }
    }

    override fun loadMore() {
        super.loadMore()
        withdrawList()
    }
}
