package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.goods.CategoryGoodsLastActivity
import com.ds.worldfunclub.ui.adapter.HomeTabAdapter
import com.ds.worldfunclub.ui.fragment.goodsCategory.CategoryLastFragment
import kotlinx.android.synthetic.main.activity_category_level_last.*
import javax.inject.Inject

/**
 * @Author miaom
 * @Date 2020/10/21 16:30
 */
@ActivityScope
class CategoryGoodsLastModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    val pager = HomeTabAdapter(activity.supportFragmentManager)

    override fun onReady() {
        super.onReady()
        if(activity(activity).category ==null||activity(activity).category !!.childx==null||activity(activity).category !!.childx.isEmpty()){
            toast("当前分类下尚未上架商品")
            activity.finish()
            return
        }
        pager.titles.addAll(activity(activity).category!!.childx.map { it.name })
        pager.setData(ArrayList(activity(activity).category!!.childx.map {
            CategoryLastFragment(it)
        }))


        activity.viewPager.adapter = pager
        activity.tabLayout.setupWithViewPager(activity.viewPager)
    }

    override fun activity(activity: AppCompatActivity): CategoryGoodsLastActivity {
        return activity as CategoryGoodsLastActivity
    }
}