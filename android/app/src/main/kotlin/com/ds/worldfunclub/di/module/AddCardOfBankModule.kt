package com.ds.worldfunclub.di.module

import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.vip.AddCardOfBankActivity
import com.ds.worldfunclub.viewmodel.AddCardOfBankModel
import dagger.Module
import dagger.Provides

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午4:11
 */

@Module
class AddCardOfBankModule(private val activity: AddCardOfBankActivity) {

    @ActivityScope
    @Provides
    fun provideAddCardOfBankModel(app: App, api: Api): AddCardOfBankModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(AddCardOfBankModel::class.java)

    }
}
