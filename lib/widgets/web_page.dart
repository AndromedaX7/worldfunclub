
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:worldfunclub/utils/log.dart';

class WebViewWrapper extends StatefulWidget {
  final String content;

  WebViewWrapper(this.content);

  @override
  _WebViewWrapperState createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  @override
  Widget build(BuildContext context) {
        return WebViewProgress(widget.content);
  }
}

class WebViewProgress extends StatefulWidget {
  final String content;

  WebViewProgress(this.content) ;

  @override
  _WebViewProgressState createState() => _WebViewProgressState();
}

class _WebViewProgressState extends State<WebViewProgress> {
  // final Completer<WebViewController> _controller =
  // Completer<WebViewController>();

  InAppWebViewController _controller;
  @override
  void initState() {
    super.initState();
    // try {
      // _controller.future.then((value) {
      //   String contentBase64 =
      //   base64Encode(const Utf8Encoder().convert(htmlWrapper(widget.content)));
      //   setState(() {
      //     value.loadUrl('data:text/html;base64,$contentBase64');
      //   });
      //

      // });
    // } catch (e) {
    //   print("hasErr");
    // }
  }



  double htmlHeight = 5;
  int maxHtmlHeight =5000;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: htmlHeight,
        child: Builder(
          builder: (c){
            return  InAppWebView(
              // javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (w) {
                w.loadData(data: htmlWrapper(widget.content));
              },

              onPageCommitVisible: (w,url)async {
                final int  scrollHeight = await  w.evaluateJavascript(source: '(() => document.body.scrollHeight)();');
                if (scrollHeight != null) {
                  setState(() {


                    htmlHeight =min<int> ( scrollHeight ,maxHtmlHeight).toDouble();
                    print(htmlHeight);
                    print(scrollHeight);
                  });
                }
              },
            );
          },
        )
    );
  }


}
String htmlWrapper(String content) {
  Log.d(content);
  String result = "<html>\n" +
      "    <head>\n" +
      "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
      "    </head>\n" +
      "    <body>\n" +
      content. replaceAll(RegExp("src"), "style=width:100% src")  +

      "    </body>\n" +
      "</html>";
  return result;
  // String result = "<html>\n" +
  //     "    <head>\n" +
  //     "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
  //     "    </head>\n" +
  //     "    <body>\n" +
  //     content. replaceAll(RegExp("width:([ ]*)([0-9]*px)"), "width:100%")  +
  //     "    </body>\n" +
  //     "</html>";
  // return result;
}

/**
 * W/PlatformViewsController(18235): Creating a virtual display of size: [1012, 18976] may result in problems(https://github.com/flutter/flutter/issues/2897).It is larger than the device screen size: [1080, 2133].
    W/ContentCatcher(18235): Failed to notify a WebView
    E/InputMethodManager(18235): b/117267690: Failed to get fallback IMM with expected displayId=63 actual IMM#displayId=0 view=com.pichillilorenzo.flutter_inappwebview.InAppWebView.InAppWebView{1ef1489 VFEDHVCL. ........ 0,0-1080,14}
    W/BpBinder(18235): Slow Binder: BpBinder transact took 219 ms, interface=android.view.IWindowSession, code=12 oneway=false
    W/ContentCatcher(18235): Failed to notify a WebView
    W/Looper  (18235): Slow Looper main: doFrame is 413ms late because of 1 msg
    W/BpBinder(18235): Slow Binder: BpBinder transact took 203 ms, interface=android.gui.IGraphicBufferProducer, code=6 oneway=false
    W/BpBinder(18235): Slow Binder: BpBinder transact took 335 ms, interface=android.gui.IGraphicBufferProducer, code=2 oneway=false
    I/Choreographer(18235): Skipped 34 frames!  The application may be doing too much work on its main thread.
    W/Looper  (18235): Slow Looper main: doFrame is 581ms late because of 2 msg, msg 1 took 595ms (seq=210 running=9ms runnable=2ms io=8ms h=android.view.Choreographer$FrameHandler c=android.view.Choreographer$FrameDisplayEventReceiver)
    I/OpenGLRenderer(18235): Davey! duration=804ms; Flags=0, IntendedVsync=215631859701816, Vsync=215632426368460, OldestInputEvent=9223372036854775807, NewestInputEvent=0, HandleInputStart=215632443689720, AnimationStart=215632443698678, PerformTraversalsStart=215632449159668, DrawStart=215632449356126, SyncQueued=215632451834511, SyncStart=215632453010918, IssueDrawCommandsStart=215632453319772, SwapBuffers=215632509764303, FrameCompleted=215632664900813, DequeueBufferDuration=723000, QueueBufferDuration=151627000,
    E/OpenGLRenderer(18235): [SurfaceTexture-0-18235-0] bindTextureImage: error binding external image: 0x502
    E/flutter (18235): [ERROR:flutter/shell/platform/android/platform_view_android_jni_impl.cc(46)] java.lang.RuntimeException: Error during updateTexImage (see logcat for details)
    E/flutter (18235): 	at android.graphics.SurfaceTexture.nativeUpdateTexImage(Native Method)
    E/flutter (18235): 	at android.graphics.SurfaceTexture.updateTexImage(SurfaceTexture.java:248)
    E/flutter (18235): 	at io.flutter.embedding.engine.renderer.SurfaceTextureWrapper.updateTexImage(SurfaceTextureWrapper.java:38)
    E/flutter (18235):
    F/flutter (18235): [FATAL:flutter/shell/platform/android/platform_view_android_jni_impl.cc(1211)] Check failed: CheckException(env).
    W/BpBinder(18235): Slow Binder: BpBinder transact took 447 ms, interface=android.gui.IGraphicBufferProducer, code=6 oneway=false
    V/AutofillManager(18235): requestHideFillUi(null): anchor = null
    W/BpBinder(18235): Slow Binder: BpBinder transact took 216 ms, interface=android.gui.IGraphicBufferProducer, code=6 oneway=false
    W/RenderInspector(18235): DequeueBuffer time out on Sys2030:com.ds.worldfunclub/com.ds.worldfunclub.MainActivity, count=3, avg=130 ms, max=335 ms.
    W/Looper  (18235): Slow Looper main: doFrame is 467ms late because of 3 msg, msg 1 took 474ms (seq=240 running=4ms runnable=3ms late=75ms h=android.view.Choreographer$FrameHandler c=android.view.Choreographer$FrameDisplayEventReceiver)
    W/BpBinder(18235): Slow Binder: BpBinder transact took 233 ms, interface=android.gui.IGraphicBufferProducer, code=6 oneway=false
    I/OpenGLRenderer(18235): Davey! duration=750ms; Flags=0, IntendedVsync=215632959398367, Vsync=215633426065015, OldestInputEvent=9223372036854775807, NewestInputEvent=0, HandleInputStart=215633426745813, AnimationStart=215633426825501, PerformTraversalsStart=215633432392011, DrawStart=215633432654980, SyncQueued=215633464930865, SyncStart=215633629380709, IssueDrawCommandsStart=215633629467115, SwapBuffers=215633641338105, FrameCompleted=215633874801178, DequeueBufferDuration=8898000, QueueBufferDuration=233297000,
    W/BpBinder(18235): Slow Binder: BpBinder transact took 232 ms, interface=android.gui.IGraphicBufferProducer, code=6 oneway=false
    W/BpBinder(18235): Slow Binder: BpBinder transact took 430 ms, interface=android.gui.IGraphicBufferProducer, code=6 oneway=false
    F/libc    (18235): Fatal signal 6 (SIGABRT), code -6 (SI_TKILL) in tid 18416 (1.raster), pid 18235 (ds.worldfunclub)
 *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
    Build fingerprint: 'xiaomi/ginkgo/ginkgo:10/QKQ1.200114.002/V12.0.2.0.QCOCNXM:user/release-keys'
    Revision: '0'
    ABI: 'arm64'
    Timestamp: 2020-11-28 17:09:50+0800
    pid: 18235, tid: 18416, name: 1.raster  >>> com.ds.worldfunclub <<<
    uid: 10273
    signal 6 (SIGABRT), code -6 (SI_TKILL), fault addr --------
    Abort message: '[FATAL:flutter/shell/platform/android/platform_view_android_jni_impl.cc(1211)] Check failed: CheckException(env).
    '
    x0  0000000000000000  x1  00000000000047f0  x2  0000000000000006  x3  00000076e970acc0
    x4  0000000000000080  x5  0000000000000080  x6  0000000000000080  x7  8000000000000000
    x8  00000000000000f0  x9  a09544d05f27dc52  x10 0000000000000001  x11 0000000000000000
    x12 fffffff0fffffbdf  x13 0000000000000003  x14 0000000000000001  x15 0000000000000010
    x16 00000077e59588c0  x17 00000077e5934a80  x18 00000076e10ce000  x19 000000000000473b
    x20 00000000000047f0  x21 00000000ffffffff  x22 00000076e43352f8  x23 00000076f9b9b1e0
    x24 0000000000000000  x25 00000076e970d020  x26 0000000000000000  x27 000000000000004d
    x28 0000000000000001  x29 00000076e970ad60
    sp  00000076e970aca0  lr  00000077e58e61c4  pc  00000077e58e61f0
    backtrace:
    #00 pc 00000000000831f0  /apex/com.android.runtime/lib64/bionic/libc.so (abort+160) (BuildId: 85ab2bc1ae7f4dbc4ee5d68f94085e8b)
    #01 pc 00000000012fb0d4  /data/app/com.ds.worldfunclub-TEgdKM96hl_MnJ6vCbHVjA==/lib/arm64/libflutter.so (BuildId: 17d5f733b430bb95ed8daaf73e9b5c6fa271e342)
    #02 pc 00000000001b5207  /data/app/com.ds.worldfunclub-TEgdKM96hl_MnJ6vCbHVjA==/lib/arm64/libflutter.so (BuildId: 17d5f733b430bb95ed8daaf73e9b5c6fa271e342)
    Lost connection to device.

 */