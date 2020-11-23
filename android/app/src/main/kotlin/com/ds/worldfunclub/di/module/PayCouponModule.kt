package com.ds.worldfunclub.di.module
import androidx.lifecycle.ViewModelProvider
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.ViewModelFactory2
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.live.PayCouponActivity
import com.ds.worldfunclub.viewmodel.PayCouponModel
import dagger.Module
import dagger.Provides

/**
 * @Author mi
 * @Date 2020/8/19 10:22 AM
 */

@Module
class PayCouponModule(private val activity: PayCouponActivity) {

    @ActivityScope
    @Provides
    fun providePayCouponModel(app: App, api: Api): PayCouponModel {
        return ViewModelProvider(
            activity,
            ViewModelFactory2(activity, app, api)
        ).get(PayCouponModel::class.java)

    }
}