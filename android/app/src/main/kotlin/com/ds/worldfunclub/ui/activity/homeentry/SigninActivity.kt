package com.ds.worldfunclub.ui.activity.homeentry

import android.graphics.Color
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.signinActivity
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerSigninComponent
import com.ds.worldfunclub.di.module.SigninModule
import com.ds.worldfunclub.viewmodel.SigninModel

/**
 * @Author 12031
 * @Date 2020/7/14 10:51
 */

@Route(path = signinActivity)
class SigninActivity : BaseActivity<SigninModel>() {
    override fun layoutId() = R.layout.activity_signin

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.BLACK)
        DaggerSigninComponent.builder()
            .appComponent(appComponent)
            .signinModule(SigninModule(this))
            .build()
            .linked(this)
    }
    override fun onBackPressed() {
        finishAfterTransition()
    }
}
