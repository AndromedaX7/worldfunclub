package com.ds.worldfunclub.validate

import android.content.Context
import com.ds.worldfunclub.responsebean.AddressArea
import com.ds.worldfunclub.validate.annotation.*


open class ValidateBean(val context: Context) {
    fun validate(validate: () -> Unit) {
        if (ValidateArgs.validate(context, this)) {
            validate()
        }
    }
}

//@Docs(title = "验证实体类", message = "用于验证手机号和验证码")
class ValidatePhoneWithCode(
    @field:NotNull(msg = "手机号为空")
    @field:RegexValidate(
        msg = "手机号格式不正确",
        reg = "^1[3-9]\\d{9}$"
    )
    @field:Length(
        value = 11,
        msg = "手机号长度不正确"
    )
    var phone: String,
    @field:Length(value = 4, msg = "验证码长度不正确")
    @field:NotNull(msg = "验证码为空")
    var code: String,
    context: Context
) : ValidateBean(context)

class ValidateLogin(
    @field:NotNull(msg = "手机号为空") @field:RegexValidate(
        msg = "手机号格式不正确",
        reg = "^1[3-9]\\d{9}$"
    ) @field:Length(value = 11, msg = "手机号长度不正确") var phone: String,
    @field:NotNull(msg = "密码为空") var password: String,
    context: Context
) : ValidateBean(context)

class ValidateLogin2(
    @field:NotNull(msg = "手机号为空") @field:RegexValidate(
        msg = "手机号格式不正确",
        reg = "^1[3-9]\\d{9}$"
    ) @field:Length(value = 11, msg = "手机号长度不正确") @field:PrintMsg var phone: String,
    @field:NotNull(msg = "密码为空") @field:PrintMsg var password: String,
    @field:LengthRange(
        min = 1,
        max = 10,
        msg = "昵称长度不合法"
    ) @field:NotNull(msg = "昵称为空") @field:PrintMsg var nickName: String,
    @field:Length(value = 4, msg = "验证码长度不正确") @field:NotNull(msg = "验证码为空") var code: String,
    context: Context
) : ValidateBean(context)

class ValidatePasswordAgain(
    @field:NotNull(msg = "新密码为空") var password: String, @field:NotNull(
        msg = "重复密码为空"
    ) var password2: String, context: Context
) : ValidateBean(context)

class ValidatePasswordAgainWithOldPassword(
    @field:NotNull(msg = "旧密码为空") var oldPassword: String,
    @field:NotNull(msg = "新密码为空") var password: String,
    @field:NotNull(msg = "重复密码为空") var password2: String, context: Context
) : ValidateBean(context)

//@Docs(title = "验证实体类", message = "用于验证手机号位数与结构")
class ValidatePhone(
    @field:PrintMsg
    @field:Length(
        value = 11,
        msg = "手机号长度不正确"
    ) @field:RegexValidate(
        reg = "^1[3-9]\\d{9}",
        msg = "手机号格式不正确"
    ) @field:NotNull(msg = "手机号为空") var phone: String, context: Context
) : ValidateBean(context)

class ValidateSendCode(
    @field:NotNull(msg = "手机号为空") @field:RegexValidate(
        msg = "手机号格式不正确",
        reg = "^1[3-9]\\d{9}$"
    ) @field:Length(value = 11, msg = "手机号长度不正确") @field:PrintMsg var phone: String,
    context: Context
) : ValidateBean(context)

class ValidateAddressData(
    @field:NotNull(msg = "请选择省级行政区域")
    var area1: AddressArea?,
    @field:NotNull(msg = "请选择市级行政区域")
    var area2: AddressArea?,
    @field:NotNull(msg = "请选择县级行政区域")
    var area3: AddressArea?,
    @field:NotNull(msg = "请输入详细地址")
    var fullAddress: String,
    @field:NotNull(msg = "请输入收件人姓名")
    var name: String,
    @field:Length(
        value = 11,
        msg = "手机号长度不正确"
    ) @field:RegexValidate(
        reg = "^1[3-9]\\d{9}",
        msg = "手机号格式不正确"
    ) @field:NotNull(msg = "手机号为空")
    var mobile: String,
    context: Context

) : ValidateBean(context)

class ValidatePayLive(
      context: Context,
    @field:NotNull(msg = "请输入姓名")
    val name: String,
    @field:RegexValidate(
        reg = "^1[3-9]\\d{9}",
        msg = "手机号格式不正确"
    )
    @field:Length(11,msg="手机号长度不正确")
    @field:NotNull(msg = "手机号为空")
    var mobile: String,

    @field:NotNull(msg = "请选择预约时间")
    var date:String
):ValidateBean(context)

class ValidatePayLive2(
    context: Context,
    @field:NotNull(msg = "请输入姓名")
    val name: String,
    @field:RegexValidate(
        reg = "^1[3-9]\\d{9}",
        msg = "手机号格式不正确"
    )
    @field:Length(11,msg="手机号长度不正确")
    @field:NotNull(msg = "手机号为空")
    var mobile: String,
):ValidateBean(context)
class ValidateBank(
    context: Context,
    @field:NotNull(msg = "请输入持卡人姓名")
    val name: String,

    @field:RegexValidate(
        reg = "^1[3-9]\\d{9}",
        msg = "手机号格式不正确"
    )
    @field:Length(11,msg="手机号长度不正确")
    @field:NotNull(msg = "请输入手机号")
    var mobile: String,
    @field:NotNull(msg = "请输入银行卡号")
    var cardCode:String,
    @field:NotNull(msg = "请输入所属银行")
    var cardBelong:String,
    @field:NotNull(msg = "请输入开户行")
    var openName:String,
):ValidateBean(context)