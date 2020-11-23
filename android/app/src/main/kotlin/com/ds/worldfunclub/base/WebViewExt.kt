package com.ds.worldfunclub.base

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.util.Log
import android.webkit.*


@SuppressLint("SetJavaScriptEnabled")
fun WebView.createSettings() {
    scrollBarStyle = WebView.SCROLLBARS_OUTSIDE_OVERLAY
    requestFocusFromTouch()

    settings.javaScriptEnabled = true// 支持JS
    settings.javaScriptCanOpenWindowsAutomatically = true
    settings.useWideViewPort = true
    settings.layoutAlgorithm = WebSettings.LayoutAlgorithm.TEXT_AUTOSIZING//
    settings.loadWithOverviewMode = true
    settings.javaScriptCanOpenWindowsAutomatically = true//支持通过js打开新的窗口
    settings.setRenderPriority(WebSettings.RenderPriority.HIGH)//提高渲染等级
    settings.builtInZoomControls = false// 设置支持缩放
    settings.domStorageEnabled = true//使用localStorage则必须打开
    settings.blockNetworkImage = true// 首先阻塞图片，让图片不显示
    settings.blockNetworkImage = false//  页面加载好以后，在放开图片：
    settings.setSupportMultipleWindows(false)// 设置同一个界面
    settings.blockNetworkImage = false
    settings.cacheMode = WebSettings.LOAD_CACHE_ELSE_NETWORK
    settings.setNeedInitialFocus(false)// 禁止webview上面控件获取焦点(黄色边框)


    webViewClient = object : WebViewClient() {

        override fun shouldOverrideUrlLoading(view: WebView, url: String): Boolean {
            //                if (url.startsWith("tenvideo2:")) {
            //                    Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url)).setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            //                    startActivity(intent);
            //                    return true;
            //                }
            view.loadUrl(url)
            /**
             * 网页跳转：
             * 1.在当前的webview跳转到新连接
             * view.loadUrl(url);
             * 2.调用系统浏览器跳转到新网页
             * Intent i = new Intent(Intent.ACTION_VIEW);
             * i.setData(Uri.parse(url));
             * startActivity(i);
             */
            return true
        }
    }

    webChromeClient = object : WebChromeClient() {

    }
}

@SuppressLint("JavascriptInterface")
fun WebView.createSettings(jsInference: Any, jsNamespace: String) {
    createSettings()
    appendJsInference(jsInference, jsNamespace)

}

@SuppressLint("JavascriptInterface")
fun WebView.appendJsInference(jsInference: Any, jsNamespace: String) {
    val declaredMethods = jsInference.javaClass.declaredMethods
    for (md in declaredMethods) {
        if (md.getAnnotation(JavascriptInterface::class.java) != null) {
            addJavascriptInterface(jsInference, jsNamespace)
            break
        }
    }

}

fun WebView.loadPlantText(content: String) {
    loadData(wrapContent2(content),"text/html", "utf-8")
}

fun WebView. wrapContent(contentSrc: String): String {
    return "<html>\n" +
            "    <head>\n" +
            "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
            "    </head>\n" +
            "    <body>\n" +
            contentSrc
                .replace(Regex("width:([ ]*)([0-9]*px)"), "width:100%")
                .replace("&lt;", "<")
                .replace("&gt;", ">")
                .replace("&amp;", "&")
                .replace("&nbsp;", "")
                .replace("&quot;", "\"") +
            "    </body>\n" +
            "</html>"
}
fun WebView. wrapContent2(contentSrc: String): String {
    return "<html>\n" +
            "    <head>\n" +
            "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
            "    </head>\n" +
            "    <body>\n" +
            contentSrc
                .replace(Regex("src"), "style=width:100% src")
                .replace("&lt;", "<")
                .replace("&gt;", ">")
                .replace("&amp;", "&")
                .replace("&nbsp;", "")
                .replace("&quot;", "\"") +
            "    </body>\n" +
            "</html>"
}