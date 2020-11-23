package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.EvaluationModule
import com.ds.worldfunclub.ui.activity.order.EvaluationActivity
import dagger.Component

/**
 * @Author miaom
 * @Date 2020/10/27 13:46
 */


@ActivityScope
@Component(modules = [EvaluationModule::class], dependencies = [AppComponent::class])
interface EvaluationComponent {
    fun linked(activity: EvaluationActivity)
}
