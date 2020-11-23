package com.google.zxing.client.android.encode

import android.graphics.Bitmap
import com.google.zxing.BarcodeFormat
import com.google.zxing.datamatrix.DataMatrixWriter

class DataMatrixEncoder : Encoder() {
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return createBitmap(
            parseBitMatrix(
                DataMatrixWriter().encode(
                    content,
                    BarcodeFormat.DATA_MATRIX,
                    width,
                    height
                ), width, height, showColorInt, backgroundColor
            ), width, height
        )
    }
}
