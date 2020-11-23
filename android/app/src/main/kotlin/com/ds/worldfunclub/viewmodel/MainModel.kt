package com.ds.worldfunclub.viewmodel

import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.Bindable
import androidx.fragment.app.Fragment
import com.ds.worldfunclub.BR
import com.ds.worldfunclub.app.App
import com.ds.worldfunclub.base.BaseModel
import com.ds.worldfunclub.di.ActivityScope
import com.ds.worldfunclub.network.Api
import com.ds.worldfunclub.ui.activity.MainActivity
import com.ds.worldfunclub.ui.fragment.home.*
import kotlinx.android.synthetic.main.activity_main.*
import javax.inject.Inject

/**
 * @Author 12031
 * @Date 2020/7/4 14:38
 */
@ActivityScope
class MainModel @Inject constructor(
    val activity: AppCompatActivity,
    val app: App, val api: Api
) : BaseModel(activity) {

    val FRAGMENT_POOL = ArrayList<Fragment>()

    @get:Bindable
    var pos = 0
        set(value) {
            field = value
            notifyPropertyChanged(BR.pos)
        }


    fun onBottomTap(pos: Int) {
        activity.supportFragmentManager.beginTransaction()
            .hide(FRAGMENT_POOL[this.pos])
            .show(FRAGMENT_POOL[pos])
            .commit()
        this.pos = pos
//        StatusBarBackground(activity, activity(activity).getStatusBarColor())
//            .setStatusBarBackgroundColor()
    }

    override fun onReady() {
        FRAGMENT_POOL.add(MainFragment())
        FRAGMENT_POOL.add(VipFragment())
        FRAGMENT_POOL.add(LiveFragment())
        FRAGMENT_POOL.add(ClubFragment())
        FRAGMENT_POOL.add(MineFragment())
        val commit = activity.supportFragmentManager.beginTransaction()
        for (i in 0 until 5) {
            commit.add(activity.frame.id, FRAGMENT_POOL[i])
        }
        for (i in 0 until 5) {
            if (i == 0) {
                commit.show(FRAGMENT_POOL[i])
            } else {
                commit.hide(FRAGMENT_POOL[i])
            }
        }
        commit.commit()
    }

    override fun activity(activity: AppCompatActivity): MainActivity {
        return activity as MainActivity
    }
}