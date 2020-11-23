package com.ds.worldfunclub.ui.activity.order

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.delicacyCommit
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerDelicacyCommitComponent
import com.ds.worldfunclub.di.module.DelicacyCommitModule
import com.ds.worldfunclub.responsebean.LiveBuy
import com.ds.worldfunclub.viewmodel.DelicacyCommitModel

/**
 * @Author miaom
 * @Date 2020/10/22 16:57
 */
@Route(path = delicacyCommit)
class DelicacyCommitActivity : BaseActivity<DelicacyCommitModel>() {
    override fun layoutId() = R.layout.activity_delicacy_commit

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerDelicacyCommitComponent.builder()
            .appComponent(appComponent)
            .delicacyCommitModule(DelicacyCommitModule(this))
            .build()
            .linked(this)
    }

    @Autowired
    @JvmField
    var data: LiveBuy? = null
}