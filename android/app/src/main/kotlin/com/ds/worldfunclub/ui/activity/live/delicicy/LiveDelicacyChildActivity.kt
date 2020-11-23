package com.ds.worldfunclub.ui.activity.live.delicicy

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.delicacyChild
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerLiveDelicacyChildComponent
import com.ds.worldfunclub.di.module.LiveDelicacyChildModule
import com.ds.worldfunclub.viewmodel.LiveDelicacyChildModel
import com.ds.worldfunclub.widget.DropDownManager

/**
 * @Author nekoneko
 * @Date 2020/7/28 上午10:10
 */
@Route(path = delicacyChild)
class LiveDelicacyChildActivity : BaseActivity<LiveDelicacyChildModel>() {
    override fun layoutId() = R.layout.activity_delicacy_child

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerLiveDelicacyChildComponent.builder()
            .appComponent(appComponent)
            .liveDelicacyChildModule(LiveDelicacyChildModule(this))
            .build()
            .linked(this)
    }

    override fun onBackPressed() {
        if (DropDownManager.popupWindow?.isShowing == true) {
            DropDownManager.dismiss()
        } else
            super.onBackPressed()
    }


}