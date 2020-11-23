package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.responsebean.MessageData

class MessageDelegate: BindingDelegate2<MessageData>() {
    override fun layoutId()= R.layout.item_message_center
    override fun isForViewType(item: MessageData?)=true
}