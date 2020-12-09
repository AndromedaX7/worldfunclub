package com.ds.worldfunclub.validate

import android.content.Context
import com.ds.worldfunclub.validate.annotation.Length
import com.ds.worldfunclub.validate.annotation.NotNull
import com.ds.worldfunclub.validate.annotation.RegexValidate


open class ValidateBean(val context: Context) {
    fun validate(validate: () -> Unit) {
        if (ValidateArgs.validate(context, this)) {
            validate()
        }
    }
}


class ValidateBank(
        context: Context,
        @field:NotNull(msg = "请输入持卡人姓名")
        val name: String,

        @field:RegexValidate(
                reg = "^1[3-9]\\d{9}",
                msg = "手机号格式不正确"
        )
        @field:Length(11, msg = "手机号长度不正确")
        @field:NotNull(msg = "请输入手机号")
        var mobile: String,
        @field:NotNull(msg = "请输入银行卡号")
        var cardCode: String,
        @field:NotNull(msg = "请输入所属银行")
        var cardBelong: String,
        @field:NotNull(msg = "请输入开户行")
        var openName: String,
) : ValidateBean(context)