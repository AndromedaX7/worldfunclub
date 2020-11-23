package com.google.zxing.client.android.encode

import android.graphics.Bitmap
import com.google.zxing.BarcodeFormat
import com.google.zxing.WriterException
import com.google.zxing.qrcode.QRCodeWriter

class QrCodeEncoder : Encoder() {
    override fun encode(
        content: String ,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap?  {
        try {
            val bitMatrix =
                QRCodeWriter().encode(content, BarcodeFormat.QR_CODE, width, height, encodeMap())
            val pixels = IntArray(width * height)
            for (y in 0 until height) {
                for (x in 0 until width) {
                    if (bitMatrix[x, y]) {
                        pixels[y * width + x] = showColorInt
                    } else {
                        pixels[y * width + x] = backgroundColor
                    }
                }
            }
            val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
            bitmap.setPixels(pixels, 0, width, 0, 0, width, height)
            return bitmap
        } catch (e: WriterException) {
            e.printStackTrace()
        }
        return null
    }
}