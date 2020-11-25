package com.ds.worldfunclub.viewmodel

import android.content.DialogInterface
import android.view.View
import android.widget.TextView
import androidx.core.app.ActivityOptionsCompat
import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.myProfit
import com.ds.worldfunclub.app.myVip
import com.ds.worldfunclub.app.withdraw
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.dialog.SimpleDialog
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/6 15:15
 */
@FragmentScope
class VipFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireContext()) {



    @get:Bindable
    var nickname=""
    set(value) {
        field= value
        notifyPropertyChanged(BR.nickname)
    }
    @get:Bindable
    var avatar=""
        set(value) {
            field= value
            notifyPropertyChanged(BR.avatar)
        }


    override fun onResume() {
        super.onResume()
        if (app.wxInfo == null) {
            nickname = "请登录"
        } else {
            avatar = app.wxInfo!!.avatar
            nickname = app.wxInfo!!.nickname
        }

        app.reLogin = false
    }

    fun orderList(v: View) {
        ARouter.getInstance().build(com.ds.worldfunclub.app.orderList).withOptionsCompat(
            ActivityOptionsCompat.makeSceneTransitionAnimation(
                activity.requireActivity(),
                v.findViewById<TextView>(R.id.app_title),
                activity.getString(R.string.tran_app_title)
            )
        ).withString("state", "0")
            .navigation(v.context)
    }

    fun openWithdraw() {
        ARouter.getInstance().build(withdraw).navigation()
    }

    fun openMyVip() {
        ARouter.getInstance().build(myVip).navigation()
    }

    fun openMyProfit() {
        ARouter.getInstance().build(myProfit).navigation()
    }

    fun openDialog() {
        val dialog = SimpleDialog(activity.requireActivity())
        dialog.setTitle("提示")
            .setContent("您的专属导师微信号：103146431\n关于省钱赚钱的问题，请复制微信号\n去微信添加好友咨询吧~\n添加时请备注：环球途乐会成员")
            .onConfirm("复制微信", DialogInterface.OnClickListener { _, _ -> })
            .onCancel(DialogInterface.OnClickListener { _, _ -> })
            .show()
    }
}