package com.ds.worldfunclub.ui.activity.vip

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.cardImage
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerAddCardImageComponent
import com.ds.worldfunclub.di.module.AddCardImageModule
import com.ds.worldfunclub.viewmodel.AddCardImageModel

/**
 * @Author nekoneko
 * @Date 2020/7/25 下午2:36
 */

@Route(path = cardImage)
class AddCardImageActivity : BaseActivity<AddCardImageModel>() {
    override fun layoutId() = R.layout.activity_add_card_image

    override fun init(appComponent: AppComponent) {
        DaggerAddCardImageComponent.builder()
            .appComponent(appComponent)
            .addCardImageModule(AddCardImageModule(this))
            .build()
            .linked(this)
    }
}