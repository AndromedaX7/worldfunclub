package com.ds.worldfunclub.ui.activity.live.delicicy

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.delicacyDetails
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerDelicicyDetailsComponent
import com.ds.worldfunclub.di.module.DelicicyDetailsModule
import com.ds.worldfunclub.viewmodel.DelicicyDetailsModel

/**
 * @Author miaom
 * @Date 2020/10/21 11:45
 */
@Route(path = delicacyDetails)
class DelicacyDetailsActivity : BaseActivity<DelicicyDetailsModel>() {
    override fun layoutId() = R.layout.activity_delicicy_details

    @Autowired
    @JvmField
    var goodsId =""


    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerDelicicyDetailsComponent.builder()
            .appComponent(appComponent)
            .delicicyDetailsModule(DelicicyDetailsModule(this))
            .build()
            .linked(this)
    }


}