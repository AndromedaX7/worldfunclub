package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.order.EvaluationActivity
import com.ds.worldfunclub.viewmodel.EvaluationModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/27 13:46
 */

@Module
class EvaluationModule(private val activity: EvaluationActivity) {

    @ActivityScope
    @Provides
    fun provideEvaluationModel(app: App, api: Api): EvaluationModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(EvaluationModel::class.java)

    }
}
