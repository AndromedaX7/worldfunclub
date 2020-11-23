package com.ds.worldfunclub.ui.activity.order

import android.graphics.Color
import android.os.Bundle
import android.util.Log
import com.alibaba.android.arouter.facade.annotation.Autowired
import com.alibaba.android.arouter.facade.annotation.Route
import com.ds.worldfunclub.R
import com.ds.worldfunclub.app.evaluationPage
import com.ds.worldfunclub.base.BaseActivity
import com.ds.worldfunclub.base.transparentStatus
import com.ds.worldfunclub.di.component.AppComponent
import com.ds.worldfunclub.di.component.DaggerEvaluationComponent
import com.ds.worldfunclub.di.module.EvaluationModule
import com.ds.worldfunclub.viewmodel.EvaluationModel
import kotlinx.android.synthetic.main.activity_evaluation.*

/**
 * @Author miaom
 * @Date 2020/10/27 13:45
 */
@Route(path = evaluationPage)
class EvaluationActivity : BaseActivity<EvaluationModel>() {
    override fun layoutId() = R.layout.activity_evaluation

    override fun init(appComponent: AppComponent) {
        transparentStatus(Color.WHITE)
        DaggerEvaluationComponent.builder()
            .appComponent(appComponent)
            .evaluationModule(EvaluationModule(this))
            .build()
            .linked(this)
    }


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        starBar.setOnRatingBarChangeListener { ratingBar, rating, fromUser ->
            vm.star = rating
            Log.e("change ", "--------------------->$vm.star")
        }
    }


    @JvmField
    @Autowired
    var orderId = ""

    @JvmField
    @Autowired
    var goodsId = ""

    @JvmField
    @Autowired
    var goodsImage = ""

    @JvmField
    @Autowired
    var goodsName = ""
}