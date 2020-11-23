package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.SearchGoodsData
import com.ds.worldfunclub.ui.delegate.SearchGoodsDelegate
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/8 11:10
 */
@ActivityScope
class SearchModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {
    val adapter = MultiTypeAdapter<SearchGoodsData.DataBean>()
    var type = 1
    var up = true

    init {
        adapter.addDelegate(SearchGoodsDelegate())
    }

    override fun loadMore() {
        super.loadMore()
        searchGoods()
    }

    @get:Bindable
    var searchText = ""
        set(value) {
            field = value
            notifyPropertyChanged(BR.searchText)
            willSearch()
        }


    private fun searchGoods() {
        rxLifeScope.launch {
            if (searchText == "") return@launch
            val data = if (type == 3) {
                api.searchGoodsWithPrice(searchText, page, if (up) 2 else 1)
            } else {
                api.searchGoods(searchText, page, type)
            }
            if (data.code == 1) {
                mr?.isRefreshing = false
                adapter.addData2(ArrayList(data.data))
                canLoad = true
            } else if (data.code == -2) {
                canLoad = false
                mr?.isRefreshing = false
            }

        }

    }


    fun changeState(state: Int) {
        if (state == 3) {
            up = true
        }
        type = state
        willSearch()


    }

    fun changeSort() {
        up = !up
        adapter.clear()
        willSearch()
    }

    override fun willSearch(): SearchModel {
        super.willSearch()
        adapter.clear()
        searchGoods()
        return this
    }


}

