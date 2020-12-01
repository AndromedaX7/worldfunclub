package com.ds.worldfunclub

import android.os.Bundle
import android.webkit.WebView
import androidx.appcompat.app.AppCompatActivity
import com.ds.worldfunclub.base.createSettings
import kotlinx.android.synthetic.main.activity_web_view.*

class WebViewActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_web_view)
        (webview as WebView).createSettings()
        webview.loadUrl(intent.getStringExtra("url") ?: "")
    }
}