package com.google.zxing.client.android.encode

import android.graphics.Bitmap
import com.google.zxing.BarcodeFormat
import com.google.zxing.EncodeHintType
import com.google.zxing.common.BitMatrix
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel

abstract class Encoder {

    fun encodeMap(): HashMap<EncodeHintType, Any> {
        val hints = HashMap<EncodeHintType, Any>()
        hints[EncodeHintType.CHARACTER_SET] = "utf-8"
        hints[EncodeHintType.ERROR_CORRECTION] = ErrorCorrectionLevel.H
        return hints
    }

    abstract fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap?

    fun parseBitMatrix(
        bitMatrix: BitMatrix,
        width: Int,
        height: Int,
        showColorInt: Int,
        backgroundColor: Int
    ): IntArray {

        val pixels = IntArray(width * height)
        for (x in 0 until width) {
            for (y in 0 until height) {
                if (bitMatrix[x, y]) {
                    pixels[y * width + x] = showColorInt
                } else {
                    pixels[y * width + x] = backgroundColor
                }
            }
        }
        return pixels
    }

    fun createBitmap(pixels: IntArray, width: Int, height: Int): Bitmap {
        val bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888)
        bitmap.setPixels(pixels, 0, width, 0, 0, width, height)
        return bitmap
    }

    companion object {
        @JvmStatic
        fun bitmap(
            type: BarcodeFormat, content: String,
            showColorInt: Int,
            backgroundColor: Int,
            width: Int,
            height: Int
        ): Bitmap? {
            var encoder: Encoder? = null
            when (type) {
                BarcodeFormat.AZTEC -> encoder = AztecEncoder()
                BarcodeFormat.CODABAR -> encoder = CodaBarEncoder()
                BarcodeFormat.CODE_39 -> encoder = Code39Encoder()
                BarcodeFormat.CODE_93 -> encoder = Code93Encoder()
                BarcodeFormat.CODE_128 -> encoder = Code128Encoder()
                BarcodeFormat.DATA_MATRIX -> encoder = DataMatrixEncoder()
                BarcodeFormat.EAN_8 -> encoder = EAN8Encoder()
                BarcodeFormat.EAN_13 -> encoder = EAN13Encoder()
                BarcodeFormat.ITF -> encoder = ITFEncoder()
                BarcodeFormat.QR_CODE -> encoder = QrCodeEncoder()
                BarcodeFormat.UPC_A -> encoder = UPCAEncoder()
                BarcodeFormat.UPC_E -> encoder = UPCEEncoder()
            }
            if (encoder != null)
                return encoder.encode(content, showColorInt, backgroundColor, width, height)
            else {
                return Bitmap.createBitmap(1, 1, Bitmap.Config.ALPHA_8)
            }
        }
    }
}