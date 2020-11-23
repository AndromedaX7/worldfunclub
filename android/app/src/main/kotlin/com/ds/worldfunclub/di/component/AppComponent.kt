package com.ds.worldfunclub.di.component

import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.di.module.AppModule
import com.ds.worldfunclub.di.module.NetworkModule
import com.ds.worldfunclub.network.Api
import com.google.gson.Gson
import dagger.Component
import okhttp3.OkHttpClient
import javax.inject.Singleton

@Singleton
@Component(modules = [AppModule::class, NetworkModule::class])
interface AppComponent {
    fun app(): App
    fun httpClient(): OkHttpClient
    fun gson(): Gson
    fun api():Api
}