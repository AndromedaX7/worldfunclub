package com.ds.worldfunclub.di.module

import com.ds.worldfunclub.app.App
import com.google.gson.Gson
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class AppModule(val app: App) {

    @Singleton
    @Provides
    fun provideApp(): App {
        return app
    }

    @Singleton
    @Provides
    fun provideGson(): Gson {
        return Gson()
    }

}