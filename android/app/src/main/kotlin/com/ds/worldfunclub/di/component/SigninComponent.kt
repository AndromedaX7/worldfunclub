package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SigninModule
import com.ds.worldfunclub.ui.activity.homeentry.SigninActivity
import dagger.Component

/**
 * @Author 12031
 * @Date 2020/7/14 10:51
 */



@ActivityScope
@Component(modules = [SigninModule::class], dependencies = [AppComponent::class])
interface SigninComponent {
    fun linked(activity: SigninActivity)
}

