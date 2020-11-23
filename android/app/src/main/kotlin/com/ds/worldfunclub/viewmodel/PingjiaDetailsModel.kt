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
import com.ds.worldfunclub.network.EvaluationType
import com.ds.worldfunclub.responsebean.GoodsDetailsResp2
import com.ds.worldfunclub.ui.activity.PingjiaDetailsActivity
import com.ds.worldfunclub.ui.delegate.GoodsPingjiaDelegate0
import com.ds.worldfunclub.ui.delegate.GoodsPingjiaDelegate1
import com.ds.worldfunclub.ui.delegate.GoodsPingjiaDelegate2
import com.ds.worldfunclub.ui.delegate.ThumbsHandler
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/10 14:36
 */
@ActivityScope
class PingjiaDetailsModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity), ThumbsHandler {

    @get:Bindable
    var all_count = ""
        set(value) {
            field = if (value.toInt() > 0) {
                "($value)"
            } else {
                ""
            }
            notifyPropertyChanged(BR.all_count)
        }


    @get:Bindable
    var picture_num = ""
        set(value) {
            field = if (value.toInt() > 0) {
                "($value)"
            } else {
                ""
            }
            notifyPropertyChanged(BR.picture_num)
        }


    @get:Bindable
    var praise_num = ""
        set(value) {
            field = if (value.toInt() > 0) {
                "($value)"
            } else {
                ""
            }
            notifyPropertyChanged(BR.praise_num)
        }
    @get:Bindable
    var review_num = ""
        set(value) {
            field = if (value.toInt() > 0) {
                "($value)"
            } else {
                ""
            }
            notifyPropertyChanged(BR.review_num)
        }
    @get:Bindable
    var negative_num = ""
        set(value) {
            field = if (value.toInt() > 0) {
                "($value)"
            } else {
                ""
            }
            notifyPropertyChanged(BR.negative_num)
        }




    @get:Bindable
    var type = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.type)
        }

    @get:Bindable
    val goodsPingjia = MultiTypeAdapter<GoodsDetailsResp2.DataBean.CommentDataBean>()

    init {
        goodsPingjia.addDelegate(GoodsPingjiaDelegate0(this,true))
        goodsPingjia.addDelegate(GoodsPingjiaDelegate1(this,true))
        goodsPingjia.addDelegate(GoodsPingjiaDelegate2(this,true))


    }

    override fun onReady() {
        super.onReady()
        loadPingjias()
    }

    override fun activity(activity: AppCompatActivity): PingjiaDetailsActivity {
        return activity as PingjiaDetailsActivity
    }

    private fun loadPingjias() {


        if (app.wxInfo == null) {
            toast()
            return
        } else {
            rxLifeScope.launch {
                val data = api.loadEvaluationList(
                    app.wxInfo!!.user_id,
                    app.wxInfo!!.login_token,
                    page,
                    EvaluationType.valueOf(type),
                    activity(activity).goodsId
                )
                canLoad = if (data.code == 1) {
                    data.data.comment_type_number ?.let {
                        all_count = it.all_num
                        picture_num = it.picture_num
                        praise_num = it.praise_num
                        review_num = it.review_num
                        negative_num = it.negative_num
                    }
                    goodsPingjia.addData2(ArrayList(data.data.list))
                    true
                } else {
                    toast(data)
                    false
                }
            }

        }
    }


    fun changeType(type: Int) {
        this.type = type
        willSearch()
    }

    override fun willSearch(): BaseModel {
        super.willSearch()
        goodsPingjia.clear()
        loadPingjias()
        return this
    }

    override fun loadMore() {
        super.loadMore()
        loadPingjias()
    }

    override fun addCommentThumbs(pos: Int, evaluateId: String, isThumbs: String) {
        rxLifeScope.launch {
            val data = api.addCommentThumbs(app, evaluateId, isThumbs)
            if (data.code == 1) {
                goodsPingjia.notifyItemChanged(pos)
            } else {
                toast(data)
            }
        }

    }
}

