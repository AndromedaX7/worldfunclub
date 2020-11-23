package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.withdraw
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午1:54
 */
@ActivityScope
class BalanceModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    fun showWithdraw() {
        ARouter.getInstance().build(withdraw).navigation()
    }
}
