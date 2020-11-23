package com.ds.worldfunclub.ui.activity

import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.imageSelector
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerImageSelectedComponent
import com.ds.worldfunclub.di.module.ImageSelectedModule
import com.ds.worldfunclub.viewmodel.ImageSelectedModel

/**
 * @Author 12031
 * @Date 2020/7/16 15:37
 */
@Route(path = imageSelector)
class ImageSelectedActivity : BaseActivity<ImageSelectedModel>() {
    override fun layoutId() = R.layout.activity_image_selected

    override fun init(appComponent: AppComponent) {
        DaggerImageSelectedComponent.builder()
            .appComponent(appComponent)
            .imageSelectedModule(ImageSelectedModule(this))
            .build()
            .linked(this)
    }
}
