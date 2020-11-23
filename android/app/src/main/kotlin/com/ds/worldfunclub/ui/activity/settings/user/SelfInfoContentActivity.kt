package com.ds.worldfunclub.ui.activity.settings.user

import android.graphics.Color
import android.view.Menu
import android.view.MenuItem
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.selfInfoContent
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSelfInfoContentComponent
import com.ds.worldfunclub.di.module.SelfInfoContentModule
import com.ds.worldfunclub.viewmodel.SelfInfoContentModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:24
 */
@Route(path = selfInfoContent)
class SelfInfoContentActivity : BaseActivity<SelfInfoContentModel>() {
    override fun layoutId() = R.layout.activity_self_info_content

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerSelfInfoContentComponent.builder()
            .appComponent(appComponent)
            .selfInfoContentModule(SelfInfoContentModule(this))
            .build()
            .linked(this)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when(item.itemId){
            R.id.save->
                vm.save()
        }
        return super.onOptionsItemSelected(item)
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_self_info_content_toolbar, menu)
        return true
    }

//    override fun needChangeGlobalStyle() = true
//    override fun needChangeStatusColor() = true
//    override fun statusBarColor(): Int {
//        return SkinManager.getColor(R.color.colorToolbar)
//    }


}
