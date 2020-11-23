package com.ds.worldfunclub.viewmodel

import android.content.DialogInterface
import android.content.Intent
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.rxLifeScope
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.app.*
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.cleanAll
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.settings.SettingsActivity
import com.ds.worldfunclub.ui.dialog.SimpleDialog
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/18 上午10:44
 */
@ActivityScope
class SettingsModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

//

    fun myAddress() {
        ARouter.getInstance().build(selectAddressActivity).navigation()
    }

    fun openSelfInfo() {
        ARouter.getInstance().build(selfInfo).navigation()
    }

    fun security(v: View) {
        ARouter.getInstance().build(accountAndSecurity).navigation()
    }

    fun commonUser(v: View) {
        ARouter.getInstance().build(commonUserContact).navigation()
    }

    fun about() {
        ARouter.getInstance().build(aboutUs).navigation()
    }

    fun changeTheme() {
    }

    fun exit() {

        val dialog = SimpleDialog(activity)
        dialog.setTitle("退出账号")
            .setContent("确定退出当前账号")
            .onConfirm("确定",
                DialogInterface.OnClickListener { _, _ ->
                    activity.cleanAll()
                    app.reLogin=true
                    ARouter.getInstance().build(login).navigation()
                    activity.setResult(SettingsActivity.turnHomeExit)
                    activity.finish()
                })
            .onCancel(DialogInterface.OnClickListener { _, _ -> })
            .show()

    }

    fun destroyUser() {

        val dialog = SimpleDialog(activity)
        dialog.setTitle("注销账户")
            .setContent("您将舍弃您账户内的财产，是否继续")
            .onConfirm("注销",
                DialogInterface.OnClickListener { _, _ ->
                    if(app.wxInfo==null){
                        toast()
                        return@OnClickListener
                    }
                    rxLifeScope.launch {
                        val destroyUser =
                            api.destroyUser(app.wxInfo!!.user_id, app.wxInfo!!.login_token)
                        if (destroyUser.code == 1){
                            activity.cleanAll()
                            app.reLogin=true
                            ARouter.getInstance().build(login).navigation()
                            activity.setResult(SettingsActivity.turnHomeExit)
                            activity.finish()
                        }else{
                            toast(destroyUser)
                        }
                    }

                })
            .onCancel(DialogInterface.OnClickListener { _, _ -> })
            .show()

    }
}

