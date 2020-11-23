package com.ds.worldfunclub.viewmodel

import android.Manifest
import android.content.Intent
import android.net.Uri
import android.view.View
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.DelicacyGoodsInfo
import com.ds.worldfunclub.responsebean.GoodsDetailsResp2
import com.ds.worldfunclub.responsebean.GoodsDetailsResp3
import com.ds.worldfunclub.ui.activity.live.delicicy.DelicacyDetailsActivity
import com.ds.worldfunclub.ui.delegate.DelicacyBannerDelegate
import com.ds.worldfunclub.ui.delegate.DelicacyGoodsDelegate
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/21 11:46
 */
@ActivityScope
class DelicicyDetailsModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    lateinit var details: GoodsDetailsResp3.DataBean

    var banner = MultiTypeAdapter<String>()
    var goods = MultiTypeAdapter<DelicacyGoodsInfo>()

    init {
        banner.addDelegate(DelicacyBannerDelegate())
        goods.addDelegate(DelicacyGoodsDelegate())
    }

    @get:Bindable
    var shopName = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.shopName)
        }

    @get:Bindable
    var shopAddress = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.shopAddress)
        }

    @get:Bindable
    var shopPhone = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.shopPhone)
        }

    @get:Bindable
    var shopShowTime = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.shopShowTime)
        }


    override fun onReady() {
        super.onReady()
        loadDetails()
    }

    private fun loadDetails() {
        rxLifeScope.launch {
            if (app.wxInfo == null) {
                toast()
            } else {
                val data = api.goodsDetailsLive(
                    app.wxInfo!!.user_id,
                    app.wxInfo!!.login_token,
                    activity(activity).goodsId,
                    ""
                )

                if (data.code == 1) {
                    parseDetails(data.data)
                } else {
                    toast(data)
                }
            }

        }
    }

    private fun parseDetails(data: GoodsDetailsResp3.DataBean) {
        details = data
        shopPhone = data.shopInfo.phone
        shopName = data.shopInfo.shop_name
        shopAddress =
            data.shopInfo.province + data.shopInfo.city + data.shopInfo.region + data.shopInfo.address
        shopShowTime = data.shopInfo.shop_hours
        banner.addData2(ArrayList(data.goods_images))

        if (data.spec_attr.size > 0) {
            goods.addData2(ArrayList(data.sku_list.mapIndexed { index, sku ->
                DelicacyGoodsInfo.fromGoodsDetails(
                    details,
                    sku,
                    data.spec_attr[0],
                    data.spec_attr[0].spec_items[index]
                )
            }))
        }else {
            goods.addData2(ArrayList(data.sku_list.mapIndexed { index, sku ->
                DelicacyGoodsInfo.fromGoodsDetails(
                    details,
                    sku
                )
            }))
        }


    }


    fun callShop(v:View){
        val dialog =AlertDialog.Builder(context)
            .setTitle("拨打电话")
            .setMessage("要现在拨打电话给商家吗？")
            .setPositiveButton("确定"){_,_->
                reqPermission(Manifest.permission.CALL_PHONE,10){
                    val intent=Intent(Intent.ACTION_CALL, Uri.parse("tel:${details.shopInfo.phone}"))
                    activity.startActivity(intent)
                }
            }
            .setNegativeButton("取消"){_,_->}
            .create()
            .show()
    }
    override fun activity(activity: AppCompatActivity): DelicacyDetailsActivity {
        return activity as DelicacyDetailsActivity
    }
}