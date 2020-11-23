package com.ds.worldfunclub.ui.activity.settings.user

import android.graphics.Color
import android.view.Menu
import android.view.MenuItem
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.selfInfoNickName
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSelfInfoNickNameComponent
import com.ds.worldfunclub.di.module.SelfInfoNickNameModule
import com.ds.worldfunclub.viewmodel.SelfInfoNickNameModel

/**
 * @Author tachibanako
 * @Date 2020/7/21 上午9:39
 */
@Route(path = selfInfoNickName)
class SelfInfoNickNameActivity : BaseActivity<SelfInfoNickNameModel>() {
    override fun layoutId() = R.layout.activity_modify_nickname

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerSelfInfoNickNameComponent.builder()
            .appComponent(appComponent)
            .selfInfoNickNameModule(SelfInfoNickNameModule(this))
            .build()
            .linked(this)
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_self_info_content_toolbar,menu)
        return true
    }
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when(item.itemId){
            R.id.save->{

            }
        }
        return super.onOptionsItemSelected(item)
    }

//    override fun needChangeGlobalStyle()=true
//
//    override fun needChangeStatusColor()=true
//
//    override fun statusBarColor(): Int {
//        return skinColor(R.color.colorToolbar)
//    }
}
