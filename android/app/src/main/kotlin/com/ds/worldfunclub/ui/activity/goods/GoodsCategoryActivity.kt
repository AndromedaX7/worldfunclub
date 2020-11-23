package com.ds.worldfunclub.ui.activity.goods

import android.content.Intent
import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.ViewTreeObserver
import android.view.ViewTreeObserver.OnGlobalLayoutListener
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.goodsCategory
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerGoodsCategoryComponent
import com.ds.worldfunclub.di.module.GoodsCategoryModule
import com.ds.worldfunclub.viewmodel.GoodsCategoryModel
import com.ds.worldfunclub.widget.RevealAnimation
import com.ds.worldfunclub.widget.RevealAnimation.EXTRA_CIRCULAR_REVEAL_X
import com.ds.worldfunclub.widget.RevealAnimation.EXTRA_CIRCULAR_REVEAL_Y
import kotlinx.android.synthetic.main.activity_goods_category.*

/**
 * @Author 12031
 * @Date 2020/7/9 2:33
 */
@Route(path = goodsCategory)
class GoodsCategoryActivity : BaseActivity<GoodsCategoryModel>() {
    override fun layoutId() = R.layout.activity_goods_category
    private var revealX = 0
    private var revealY = 0
    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerGoodsCategoryComponent.builder()
            .appComponent(appComponent)
            .goodsCategoryModule(GoodsCategoryModule(this))
            .build()
            .linked(this)
    }

    var mRevealAnimation: RevealAnimation? = null


    override fun initAnimate() {
        super.initAnimate()
        mRevealAnimation = RevealAnimation(root, intent, this)
    }

    fun onBackPressed(view: View) {
        mRevealAnimation?.unRevealActivity(view)
    }

    private fun onAnimateLayout(savedInstanceState: Bundle?, intent: Intent) {
        if (savedInstanceState == null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP &&
            intent.hasExtra(EXTRA_CIRCULAR_REVEAL_X) &&
            intent.hasExtra(EXTRA_CIRCULAR_REVEAL_Y)
        ) {
            root.visibility = View.INVISIBLE
            revealX = intent.getIntExtra(EXTRA_CIRCULAR_REVEAL_X, 0)
            revealY = intent.getIntExtra(EXTRA_CIRCULAR_REVEAL_Y, 0)
            val viewTreeObserver: ViewTreeObserver = root.viewTreeObserver
            if (viewTreeObserver.isAlive) {
                viewTreeObserver.addOnGlobalLayoutListener(object : OnGlobalLayoutListener {
                    override fun onGlobalLayout() {
                        mRevealAnimation?.revealActivity(revealX, revealY)
                        root.viewTreeObserver.removeOnGlobalLayoutListener(this)
                    }
                })
            }
        } else {
            root.visibility = View.VISIBLE
        }
    }
}
