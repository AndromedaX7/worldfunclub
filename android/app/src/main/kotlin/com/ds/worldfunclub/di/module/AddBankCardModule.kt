package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.merchant.AddBankCardActivity
import com.ds.worldfunclub.viewmodel.AddBankCardModel
import dagger.Module
import dagger.Provides

/**
 * @Author miaom
 * @Date 2020/10/15 13:34
 */

@Module
class AddBankCardModule(private val activity: AddBankCardActivity) {

    @ActivityScope
    @Provides
    fun provideAddBankCardModel(app: App, api: Api): AddBankCardModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(AddBankCardModel::class.java)

    }
}
