package com.ds.worldfunclub.ui.activity.merchant

import android.os.Bundle
import android.view.ContextMenu
import android.view.Menu
import android.view.MenuItem
import android.view.View
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.businessBackground
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerBusinessBackgroundComponent
import com.ds.worldfunclub.di.module.BusinessBackgroundModule
import com.ds.worldfunclub.viewmodel.BusinessBackgroundModel
import kotlinx.android.synthetic.main.activity_business_background.*

/**
 * @Author miaom
 * @Date 2020/10/14 16:13
 */

@Route(path = businessBackground)
class BusinessBackgroundActivity : BaseActivity<BusinessBackgroundModel>() {
    override fun layoutId() = R.layout.activity_business_background

    override fun init(appComponent: AppComponent) {
        DaggerBusinessBackgroundComponent.builder()
            .appComponent(appComponent)
            .businessBackgroundModule(BusinessBackgroundModule(this))
            .build()
            .linked(this)
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setSupportActionBar(toolbar)
        
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_busi,menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when(item.itemId){
            R.id.withdraw->
                vm.withdraw()
            R.id.scan->
                vm.scan()
        }

        return super.onOptionsItemSelected(item)
    }
}