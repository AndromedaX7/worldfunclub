package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.MessageData
import com.ds.worldfunclub.ui.delegate.MessageDelegate
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/13 下午1:42
 */
@ActivityScope
class MessageCenterModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    @get:Bindable
    val messageAdapter=MultiTypeAdapter<MessageData>()


    init {
        //String name, String type, String content, String title, int icon
        val  data = arrayListOf<MessageData>( MessageData("","1","年货秒杀补贴最后一天"," 服务消息", R.mipmap.ic_msg_icon0),
            MessageData("","1","年货秒杀补贴最后一天","  平台活动", R.mipmap.ic_msg_icon1),
            MessageData("","1","年货秒杀补贴最后一天","  客服留言消息", R.mipmap.ic_msg_icon2))
        messageAdapter.addDelegate(MessageDelegate())
        messageAdapter.addData2(data)
    }
}

