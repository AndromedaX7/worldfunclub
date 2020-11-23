package com.google.zxing.client.android.encode

import android.graphics.Bitmap
import com.google.zxing.BarcodeFormat
import com.google.zxing.oned.*

class CodaBarEncoder : Encoder() {
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        val bitMatrix = CodaBarWriter().encode(content, BarcodeFormat.CODABAR, width, height)
        return createBitmap(parseBitMatrix(bitMatrix, width, height, showColorInt, backgroundColor),width, height)
    }
}

class Code39Encoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return createBitmap(parseBitMatrix(Code39Writer().encode(content,BarcodeFormat.CODE_39,width, height),width, height, showColorInt, backgroundColor),width, height)
    }
}

class Code93Encoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return  createBitmap(parseBitMatrix(Code93Writer().encode(content,BarcodeFormat.CODE_93,width, height),width, height, showColorInt, backgroundColor),width, height)
    }
}

class Code128Encoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return  createBitmap(parseBitMatrix(Code128Writer().encode(content,BarcodeFormat.CODE_128,width, height),width, height, showColorInt, backgroundColor),width, height)
    }
}

class EAN8Encoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return  createBitmap(parseBitMatrix(EAN8Writer().encode(content,BarcodeFormat.EAN_8,width, height),width, height, showColorInt, backgroundColor),width, height)
    }
}

class EAN13Encoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return  createBitmap(parseBitMatrix(EAN13Writer().encode(content,BarcodeFormat.EAN_13,width, height),width, height, showColorInt, backgroundColor),width, height)
    }
}

class ITFEncoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return  createBitmap(parseBitMatrix(ITFWriter().encode(content,BarcodeFormat.ITF,width, height),width, height, showColorInt, backgroundColor),width, height)
    }
}


class UPCAEncoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return  createBitmap(parseBitMatrix(UPCAWriter().encode(content,BarcodeFormat.UPC_A,width, height),width, height, showColorInt, backgroundColor),width, height)
    }
}

class UPCEEncoder:Encoder(){
    override fun encode(
        content: String,
        showColorInt: Int,
        backgroundColor: Int,
        width: Int,
        height: Int
    ): Bitmap? {
        return  createBitmap(parseBitMatrix(UPCEWriter().encode(content,BarcodeFormat.UPC_E,width, height),width, height, showColorInt, backgroundColor),width, height)
    }
}