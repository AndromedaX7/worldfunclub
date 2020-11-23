package com.ds.worldfunclub.di.module

import com.ds.worldfunclub.BuildConfig
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.ApiImpl
import com.ds.worldfunclub.network.ApiImplV2
import dagger.Module
import dagger.Provides
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import java.util.concurrent.TimeUnit
import javax.inject.Singleton


@Module
class NetworkModule {


    @Singleton
    @Provides
    fun provideOkHttpClient(): OkHttpClient {
        val client = OkHttpClient().newBuilder()
        if (BuildConfig.DEBUG) {
            val interceptor = HttpLoggingInterceptor()
            interceptor.level = HttpLoggingInterceptor.Level.BODY
            client.addInterceptor(interceptor)
        }
        return client
            .connectTimeout(30, TimeUnit.SECONDS)
            .writeTimeout(30, TimeUnit.SECONDS)
            .readTimeout(30, TimeUnit.SECONDS)
            .build()
    }

    @Singleton
    @Provides
    fun provideApi(): Api {
        return  ApiImplV2(ApiImpl())
    }

}