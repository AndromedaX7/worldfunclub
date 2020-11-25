package com.ds.worldfunclub.ui.activity

import android.graphics.Color
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.cleanRecord
import com.ds.worldfunclub.base.toast
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerMainComponent
import com.ds.worldfunclub.di.module.MainModule
import com.ds.worldfunclub.viewmodel.MainModel

/**
 * @Author 12031
 * @Date 2020/7/4 14:37
 */

class MainActivity : BaseActivity<MainModel>() {
    private var last = 0L
    override fun layoutId() = R.layout.activity_main
//    val fargmentStatusbar = arrayListOf(
//        R.color.colorToolbar,
//        R.color.colorToolbarVip,
//        R.color.colorToolbar,
//        R.color.colorToolbar,
//        R.color.colorToolbar
//    )

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerMainComponent.builder()
                .appComponent(appComponent)
                .mainModule(MainModule(this))
                .build()
                .linked(this)

    }

    override fun onResume() {
        super.onResume()
        cleanRecord()
    }

    fun changePos() {
        vm.onBottomTap(0)
    }

//    override fun statusBarColor(): Int {
//        return skinColor(fargmentStatusbar[if(vm==null) 0 else vm.pos])
//    }
//
//    override fun needChangeGlobalStyle(): Boolean {
//        return true
//    }
//
//    override fun needChangeStatusColor(): Boolean {
//        return true
//    }

    override fun onBackPressed() {
        if (System.currentTimeMillis() - last > 2000) {
            toast("再按一次退出")
            last = System.currentTimeMillis()
        } else {
            super.onBackPressed()
        }

    }

}