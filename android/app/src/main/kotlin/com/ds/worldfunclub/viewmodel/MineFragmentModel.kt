package com.ds.worldfunclub.viewmodel

import android.Manifest
import android.app.Activity
import android.content.Intent
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import androidx.core.app.ActivityOptionsCompat
import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.*
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.GlobalStyle
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.FragmentScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.pair
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.activity.MainActivity
import com.ds.worldfunclub.ui.activity.settings.SettingsActivity
import com.ds.worldfunclub.ui.delegate.YouLikeDelegate
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/6 15:15
 */
@FragmentScope
class MineFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireContext()) {

    val settingsRequestCode = 1


    @get:Bindable
    var avatar = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.avatar)
        }

    @get:Bindable
    var nickname = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.nickname)
        }

    @get:Bindable
    val youLikeAdapter = MultiTypeAdapter<MainSeckill>()

    init {
        youLikeAdapter.addDelegate(YouLikeDelegate())
//        youLikeAdapter.addData2(
//            arrayListOf(
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill()
//            )
//        )
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

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            settingsRequestCode -> {
                if (SettingsActivity.turnHomeExit == resultCode) {

//                    activity.requireActivity().finish()
                    (activity.requireActivity() as MainActivity).changePos()
                }
            }
        }
    }


    fun openCart() {
        ARouter.getInstance().build(cartActivity).navigation()
    }

    fun settings() {
//        ARouter.getInstance().build(settings).navigation(activity.requireActivity() ,settingsRequestCode)
        activity.startActivityForResult(
            Intent(
                activity.requireContext(),
                SettingsActivity::class.java
            ), settingsRequestCode
        )
    }

    fun busi() {
        ARouter.getInstance().build(businessBackground).navigation(activity.context)
    }

    fun openSignIn() {
        ARouter.getInstance().build(signinActivity).navigation(activity.context)
    }

    fun orderState(view: View, state: Int) {
        val activity = view.context as Activity
        val root = view.parent.parent as LinearLayout
        val appBar = root.findViewById<TextView>(R.id.app_title)
        val pairAppBar = if (style == GlobalStyle.MaterialDesign) activity.pair(
            activity.findViewById(R.id.toolbarTrans),
            R.string.tran_app_toolbar
        ) else activity.pair(appBar, R.string.tran_app_title)

        val options = when (state) {
            4 -> {
                ActivityOptionsCompat.makeSceneTransitionAnimation(
                    activity,
                    pairAppBar,
                    activity.pair(
                        root.findViewById<LinearLayout>(R.id.willPingjia),
                        R.string.tran_order_willPingjia
                    )
                )
            }

            3 -> {
                ActivityOptionsCompat.makeSceneTransitionAnimation(
                    activity,
                    pairAppBar,
                    activity.pair(
                        root.findViewById<LinearLayout>(R.id.willReceive),
                        R.string.tran_order_willReceive
                    )
                )
            }
            2 -> {
                ActivityOptionsCompat.makeSceneTransitionAnimation(
                    activity,
                    pairAppBar,
                    activity.pair(
                        root.findViewById<LinearLayout>(R.id.willSend),
                        R.string.tran_order_willSend
                    )
                )
            }

            1 -> {
                ActivityOptionsCompat.makeSceneTransitionAnimation(
                    activity,
                    pairAppBar,
                    activity.pair(
                        root.findViewById<LinearLayout>(R.id.willPay),
                        R.string.tran_order_willPay
                    )
                )
            }
            else -> {
                ActivityOptionsCompat.makeSceneTransitionAnimation(
                    activity, pairAppBar
                )
            }
        }

        ARouter.getInstance().build(orderList).withInt("state", state).withOptionsCompat(options)
            .navigation(activity)
    }

    fun orderState(state: Int) {
        ARouter.getInstance().build(orderList).withInt("state", state).navigation(activity.context)
    }

    fun message() {
        ARouter.getInstance().build(messageCenter).navigation()
    }

    fun myFollow(view: View) {
        ARouter.getInstance().build(myFollowShop).withOptionsCompat(
            ActivityOptionsCompat.makeSceneTransitionAnimation(
                view.context as Activity,
                view.findViewById(R.id.app_title_follow),
                activity.getString(R.string.tran_app_title)
            )
        ).navigation(view.context)
    }

    fun aftermarketOrder(view: View) {
        ARouter.getInstance().build(orderAftermarket).navigation()
    }

    fun myCollectionGoods(view: View) {
        ARouter.getInstance().build(myCollection).navigation()
    }

    fun coupon() {
        ARouter.getInstance().build(myCoupon).navigation()
    }

    fun showBalance() {
        ARouter.getInstance().build(balance).navigation()
    }

    fun myFootprint(view: View) {
        ARouter.getInstance().build(footprint).navigation()
    }

    fun scan() {
        reqPermission(activity, Manifest.permission.CAMERA, 11) {
            ARouter.getInstance().build(scanCode).navigation()
        }

    }

    fun styles() {
        ARouter.getInstance().build(businessBackground).navigation()
    }

    fun liveOrder(){
        ARouter.getInstance().build(orderListLive) .navigation()
    }

}