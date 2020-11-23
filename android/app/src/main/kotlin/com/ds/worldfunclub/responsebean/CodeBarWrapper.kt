package com.ds.worldfunclub.responsebean

import com.google.zxing.BarcodeFormat
import com.ds.worldfunclub.network.OrderState
data class CodeBarWrapper(val  code:String ,val barcodeFormat: BarcodeFormat,val orderState:OrderState)