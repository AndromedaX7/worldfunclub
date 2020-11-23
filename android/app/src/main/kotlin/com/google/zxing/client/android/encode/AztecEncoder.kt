package com.google.zxing.client.android.encode

import android.graphics.Bitmap
import com.google.zxing.BarcodeFormat
import com.google.zxing.aztec.AztecWriter

class AztecEncoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
         return createBitmap(parseBitMatrix(AztecWriter().encode(content,BarcodeFormat.AZTEC,width, height),width, height, showColorInt, backgroundColor),width, height)
    }

}