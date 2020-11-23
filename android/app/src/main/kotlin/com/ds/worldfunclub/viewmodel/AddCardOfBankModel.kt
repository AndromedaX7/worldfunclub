package com.ds.worldfunclub.viewmodel

import android.app.Activity
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.validate.ValidateBank
import javax.inject.Inject

/**
 * @Author nekoneko
 * @Date 2020/7/23 下午4:09
 */
@ActivityScope
class AddCardOfBankModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    @get:Bindable
    var name = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.name)
        }

    @get:Bindable
    var phone = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.phone)
        }

    @get:Bindable
    var code = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.code)
        }

    @get:Bindable
    var bank = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.bank)
        }

    @get:Bindable
    var openName = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.openName)
        }


    fun commit() {
        if (app.wxInfo == null) {
            toast()
            return
        }
        ValidateBank(activity, name, phone, code, bank, openName).validate {
            rxLifeScope.launch {
                val addBankCard =
                    api.addBankCard(app.wxInfo!!.user_id, bank, code, openName, name, phone)
                if (addBankCard.code == 1) {
                    activity.setResult(Activity.RESULT_OK)
                    activity.finish()
                }
                toast(addBankCard)
            }
        }


    }


}
