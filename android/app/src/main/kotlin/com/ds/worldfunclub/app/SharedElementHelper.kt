package com.ds.worldfunclub.app

import android.app.Activity
import android.util.Log
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityOptionsCompat
import androidx.core.util.Pair
import com.ds.worldfunclub.R
import com.ds.worldfunclub.pair

object SharedElementHelper {

    fun newPageTitle(rootView: View): ActivityOptionsCompat? {
        if (rootView.context is Activity) {
            val activity = rootView.context as AppCompatActivity
            val title: View? = rootView.findViewById(R.id.app_title)
            title?.let {
                return ActivityOptionsCompat.makeSceneTransitionAnimation(
                    activity,
                    it,
                    activity.getString(R.string.tran_app_title)
                )
            }
        }
        return null
    }

    fun toGoodsDetails(rootView: View): ActivityOptionsCompat? {
        if (rootView.context is Activity) {
            val activity = rootView.context as AppCompatActivity
            val pair: ArrayList<Pair<View, String>> = arrayListOf()
            val goodsBanner: View? = rootView.findViewById(R.id.goodsBanner)

            goodsBanner?.let {
                Log.e("view has ?", "$goodsBanner")
                pair.add(activity.pair(it, R.string.tran_goods_details_banner))
            }
            val goodsPrice: View? = rootView.findViewById(R.id.goodsPrice)
            goodsPrice?.let {
                pair.add(activity.pair(it, R.string.tran_goods_details_price))
            }
            val goodsOriginPrice: View? = rootView.findViewById(R.id.goodsOriginPrice)
            goodsOriginPrice?.let {
                pair.add(activity.pair(it, R.string.tran_goods_details_origin_price))
            }
            val goodsName: View? = rootView.findViewById(R.id.goodsName)
            goodsName?.let {
                pair.add(activity.pair(it, R.string.tran_goods_details_goods_name))
            }
            val pairArray = Array(pair.size) {
                pair[it]
            }

            Log.e("pair size", "${pairArray.size}")

            for (p in pairArray) {
                Log.e("pair :", "$p")
            }

            if (pairArray.isNotEmpty())
                return ActivityOptionsCompat.makeSceneTransitionAnimation(activity, *pairArray)

        }

        return null
    }
}