
package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.di.module.SelfInfoModule
import com.ds.worldfunclub.ui.activity.settings.user.SelfInfoActivity
import dagger.Component

/**
 * @Author mi
 * @Date 2020/7/19 9:16 AM
 */


@ActivityScope
@Component(modules = [SelfInfoModule::class], dependencies = [AppComponent::class])
interface SelfInfoComponent {
    fun linked(activity: SelfInfoActivity)
}