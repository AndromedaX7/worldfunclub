package com.ds.worldfunclub.viewmodel

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.base.toYuan
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.network.GoodsType
import com.ds.worldfunclub.responsebean.CartData
import com.ds.worldfunclub.responsebean.CartData2
import com.ds.worldfunclub.responsebean.GoodsArr
import com.ds.worldfunclub.responsebean.MainSeckill
import com.ds.worldfunclub.ui.CallOrderCreate
import com.ds.worldfunclub.ui.delegate.CartContentDelegate
import com.ds.worldfunclub.ui.delegate.YouLikeDelegate
import kotlinx.coroutines.*
import javax.inject.Inject

/**
 * @Author tachibanako
 * @Date 2020/7/16 下午1:57
 */
@ActivityScope
class CartModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity), CallOrderCreate {


    @get:Bindable
    var editable = false
        set(value) {
            field = value
            notifyPropertyChanged(BR.editable)
        }

    @get:Bindable
    var selectedGoodsCount = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.selectedGoodsCount)
        }
    private var selectedAllCount = 0

    @get:Bindable
    var selectedAll = false
        set(value) {
            field = value
            notifyPropertyChanged(BR.selectedAll)
        }

    @get:Bindable
    val cartAdapter = MultiTypeAdapter<CartData2.DataBean.GoodsListBean>()

    @get:Bindable
    val youLikeAdapter = MultiTypeAdapter<MainSeckill>()

    init {
        cartAdapter.addDelegate(CartContentDelegate(this))
        getCartList()
        youLikeAdapter.addDelegate(YouLikeDelegate())
        youLikeAdapter.addData2(
            arrayListOf(
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill(),
//                MainSeckill()
            )
        )

    }

    @get:Bindable
    var allPrices = "0.00"
        set(value) {
            field = value
            notifyPropertyChanged(BR.allPrices)
        }

    private fun getCartList() {
        app.wxInfo?.let {
            rxLifeScope.launch {
                val data = api.getCartList(page, it.user_id, it.login_token)
                if (data.code == 1) {
                    cartAdapter.addData2(ArrayList(data.data.goods_list))
                } else {
                    toast(data)
                }
            }
        }

    }

    @Deprecated("old api")
    private fun getCartListWithMultiplyPage() {
        app.wxInfo?.let {
            rxLifeScope.launch {
                val data = api.getCartList(page, it.user_id, it.login_token)
                canLoad = if (data.code == 1) {
                    cartAdapter.addData2(ArrayList(data.data.goods_list))
                    true
                } else {
                    toast(data)
                    false
                }
                if (!canLoad)
                    selectedAllCount = Int.MAX_VALUE
            }
        }

    }

    /**
     * @param orientation if add return true else false
     */
    fun increaseCartNum(orientation: Boolean, data: CartData2.DataBean.GoodsListBean, pos: Int) {

        val num = data.total_num.toInt()
        if (orientation) {
            if (data.total_num.toInt() >= data.stock_num.toInt()) {
                return
            } else {
                data.total_num = "${num + 1}"
            }
        } else {
            if (data.total_num.toInt() <= 1) {
                return
            } else {
                data.total_num = "${num - 1}"
            }
        }
        cartAdapter.notifyItemChanged(pos)
        computeGoodsPrice()

        val code = if(orientation){
            "1"
        }else{
            "2"
        }
        app.wxInfo?.let {
            rxLifeScope.launch {
                val resp = api.increaseCartNum2(
                    code,
                    data.cart_id,
                    app.wxInfo!!.user_id,
                    app.wxInfo!!.login_token
                )
                if (resp.code == 1) {
                    toast("操作成功")
                    cartAdapter.notifyItemChanged(pos)
                    computeGoodsPrice()
                } else {
                    toast(resp)
                }
            }
        }
    }


    //    @Docs(title = "计算选中商品价格",message = "" )
    private fun computeGoodsPrice() {
        var selectedCount = 0
        var disableCount = 0
        var price = 0.0
        for (d in cartAdapter.data) {
            if (d.isSelected) {
                price += d.total_num * d.goods_price
                selectedCount++
            }
            if (!d.isEnabled) {
                disableCount++
            }
        }
        selectedGoodsCount = selectedCount
        selectedAll =
            (selectedCount == cartAdapter.data.size - disableCount) && cartAdapter.data.size != 0
        allPrices = price.toYuan()
    }

    /**
     * 购物车内商品选中/非选中控制
     */
    fun changeSelected(pos: Int) {
        computeGoodsPrice()
        cartAdapter.notifyItemChanged(pos)
    }

    /**
     * 购物车商品全选/取消全选
     */
    fun selectedAllChange() {
        selectedAll = !selectedAll
        cartAdapter.data.forEach {
            if (it.isEnabled) {
                it.isSelected = selectedAll
            }
        }
        computeGoodsPrice()
        cartAdapter.notifyItemRangeChanged(0, cartAdapter.data.size)
    }

    @Deprecated(
        "old api",
        replaceWith = ReplaceWith(
            expression = "selectedAllChange",
            imports = ["com.ds.worldfunclub.viewmodel.CartModel"]
        )
    )
    fun selectedAllChangeWithMultiplyPage() {
        GlobalScope.launch(Dispatchers.IO) {
            if (!selectedAll) {
                selectedAllCount++
                if (selectedAllCount == 1)
                    while (canLoad) {
                        loadMore()
                        delay(500)
                    }
            }

            withContext(Dispatchers.Main) {
                selectedAll = !selectedAll
                cartAdapter.data.forEach {
                    it.isSelected = selectedAll
                }
                computeGoodsPrice()
                cartAdapter.notifyItemRangeChanged(0, cartAdapter.data.size)
            }
        }
    }

    fun onEdited() {
        editable = !editable
    }

    fun onEditFinish() {
        if (editable) {
            deletedCarts()
        } else {
            createOrder()
        }
    }


    private fun createOrder() {
        val list = ArrayList<GoodsArr>()
        for (d in cartAdapter.data) {
            if (d.isSelected) {
                list.add(GoodsArr.createBy(d))
            }
        }
        createOrder(activity, list, GoodsType.Self)
    }

    private fun deletedCarts() {
        if (app.wxInfo == null) {
            toast()
        } else {
            val cartIds = ArrayList<String>()
            for (d in cartAdapter.data) {
                if (d.isSelected) {
                    cartIds.add(d.cart_id)
                }
            }
            rxLifeScope.launch {
                val data =
                    api.delCart(app.wxInfo!!.user_id, app.wxInfo!!.login_token, cartIds)
                if (data.code == 1) {
                    val iterator = cartAdapter.data.iterator()
                    while (iterator.hasNext()) {
                        val next = iterator.next()
                        if (next.isSelected) {
                            iterator.remove()
                        }
                    }
                    cartAdapter.notifyDataSetChanged()
                    computeGoodsPrice()
                    selectedAll = false
                }
            }
        }


    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == CallOrderCreate.order_comfirm_req && resultCode == Activity.RESULT_OK) {
            val iter = cartAdapter.data.iterator()
            while (iter.hasNext()) {
                val next = iter.next()
                if (next.isSelected) {
                    iter.remove()
                }
            }
            cartAdapter.notifyDataSetChanged()
            computeGoodsPrice()
        }
    }
}

operator fun String.times(src: String): Double {
    return this.toDouble() * src.toDouble()
}
