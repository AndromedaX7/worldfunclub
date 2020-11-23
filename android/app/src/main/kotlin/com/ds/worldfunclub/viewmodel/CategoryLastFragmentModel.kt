package com.ds.worldfunclub.viewmodel

import androidx.fragment.app.Fragment
import androidx.lifecycle.rxLifeScope
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.responsebean.CategoryGoods
import com.ds.worldfunclub.ui.delegate.ConcentrationDelegate3
import com.ds.worldfunclub.ui.fragment.goodsCategory.CategoryLastFragment
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/22 9:51
 */
@ActivityScope
class CategoryLastFragmentModel @Inject constructor(
    val activity: Fragment,
    val app: App, val api: Api
) : BaseModel(activity.requireContext()) {
    val adapter = MultiTypeAdapter<CategoryGoods.DataBean>()

    init {
        adapter.addDelegate(ConcentrationDelegate3())
        loadGoods()
    }


    private fun loadGoods() {
        rxLifeScope.launch {
            val data = api.categoryGoods(target().category.category_id, true,"1", page)
            canLoad=   if (data.code == 1) {
            adapter.addData2(ArrayList(data.data))
            true
        } else {
            false
        }
        }
    }

    private fun target(): CategoryLastFragment {
        return activity as CategoryLastFragment
    }

    override fun loadMore() {
        super.loadMore()
        loadGoods()
    }

}