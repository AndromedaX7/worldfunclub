package com.ds.worldfunclub.viewmodel

import android.content.DialogInterface
import android.view.LayoutInflater
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import com.alibaba.android.arouter.launcher.ARouter
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.app.selfInfoContent
import com.ds.worldfunclub.app.selfInfoNickName
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.dialog.AlertDialog
import javax.inject.Inject

/**
 * @Author mi
 * @Date 2020/7/19 9:14 AM
 */
@ActivityScope
class SelfInfoModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {


    fun changeIcon() {


        val dialog = AlertDialog(activity)
        dialog.setTitle("上传照片")
            .setOnOption1Click("拍照上传",
                DialogInterface.OnClickListener { _, _ -> })
            .setOnOption2Click("从相册选择", DialogInterface.OnClickListener { _, _ -> })
            .withCancel()
            .show()
    }

    fun content(view: View){
        ARouter.getInstance().build(selfInfoContent).navigation()
    }

    fun nickName(view: View){
        ARouter.getInstance().build(selfInfoNickName).navigation()
    }

}

