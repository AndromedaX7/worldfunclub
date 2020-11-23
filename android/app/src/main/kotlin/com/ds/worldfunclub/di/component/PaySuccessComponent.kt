package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.PaySuccessModule
import com.ds.worldfunclub.ui.activity.order.PaySuccessActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/11/3 10:10
 */


@ActivityScope
@Component(modules = [PaySuccessModule::class], dependencies = [AppComponent::class])
interface PaySuccessComponent {
    fun linked(activity: PaySuccessActivity)
}
