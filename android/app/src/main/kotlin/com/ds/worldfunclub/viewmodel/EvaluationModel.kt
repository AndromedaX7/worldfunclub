package com.ds.worldfunclub.viewmodel

import android.content.DialogInterface
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.Upload2Model
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.EvaluationActivity
import com.ds.worldfunclub.ui.adapter.AddEvaluationAdapter
import com.ds.worldfunclub.ui.adapter.FileWrapper
import com.ds.worldfunclub.ui.dialog.AlertDialog
import java.io.File
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/27 13:45
 */
@ActivityScope
class EvaluationModel @Inject constructor(
        val activity: AppCompatActivity,
        val app: App, val api: Api
) : Upload2Model(activity), LifecycleObserver {
    @get:Bindable
    val adapter = AddEvaluationAdapter(this)

    var selectData = "token"


    var star = 4f

    @get:Bindable
    var image = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.image)
        }

    @get:Bindable
    var goodsName = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsName)
        }

    @get:Bindable
    var orderId = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.orderId)
        }

    @get:Bindable
    var goodsId = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.goodsId)
        }

    @get:Bindable
    var content = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.content)
        }

    init {
        activity.lifecycle.addObserver(this)
        adapter.addData2(arrayListOf(FileWrapper(File(""), true)))
    }

    fun selectPhoto() {
        val dialog = AlertDialog(activity)
        dialog.setTitle("上传照片")
                .setOnOption1Click("拍照上传",
                        DialogInterface.OnClickListener { _, _ ->
                            selectData = "camera"
                            openCamera(selectData)
                        })
                .setOnOption2Click("从相册选择", DialogInterface.OnClickListener { _, _ ->
                    selectData = "photo"
                    openPhotos(selectData)
                })
                .withCancel()
                .show()
    }

    override fun onReady() {
        super.onReady()
        val a = activity as EvaluationActivity
        goodsId = a.goodsId
        orderId = a.orderId
        image = a.goodsImage
        goodsName = a.goodsName


    }


    override fun photoResult(token: String?, filePath: String?) {
        super.photoResult(token, filePath)
        adapter.addData2(arrayListOf(FileWrapper(File(filePath!!), false)))
    }


    fun commit() {
        if (app.wxInfo == null) {
            toast()
            return
        }
        rxLifeScope.launch {
            val saveComment = api.saveComment(
                    app.wxInfo!!.user_id,
                    app.wxInfo!!.login_token,
                    orderId,
                    goodsId,
                    star.toInt(),
                    content,
                    if (select) "1" else "0",
                    adapter.comment()
            )
            if (saveComment.code == 1) {
                toast("评论成功")
                activity.finish()
            } else {
                toast(saveComment)
            }
        }
    }

    fun selectFun() {
        select = !select
    }

    @get:Bindable
    var select = false
        set(value) {
            field = value
            notifyPropertyChanged(BR.select)
        }
}