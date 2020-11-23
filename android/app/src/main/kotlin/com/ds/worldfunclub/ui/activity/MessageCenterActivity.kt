

package com.ds.worldfunclub.ui.activity

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.messageCenter
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMessageCenterComponent
import com.ds.worldfunclub.di.module.MessageCenterModule
import com.ds.worldfunclub.viewmodel.MessageCenterModel

/**
 * @Author tachibanako
 * @Date 2020/7/13 下午1:37
 */
@Route(path = messageCenter)
class MessageCenterActivity : BaseActivity<MessageCenterModel>() {
    override fun layoutId() = R.layout.activity_message_center

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerMessageCenterComponent.builder()
            .appComponent(appComponent)
            .messageCenterModule(MessageCenterModule(this))
            .build()
            .linked(this)
    }
}
