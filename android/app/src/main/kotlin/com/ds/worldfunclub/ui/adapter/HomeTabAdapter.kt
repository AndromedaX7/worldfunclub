package com.ds.worldfunclub.ui.adapter

import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentPagerAdapter
import com.ds.worldfunclub.base.BaseFragment

class HomeTabAdapter(fm: FragmentManager) :
    FragmentPagerAdapter(fm, BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT) {
    val titles = ArrayList<String>()
    private val data = ArrayList<Fragment>()


    override fun getItem(position: Int): Fragment {
        return data[position]
    }

    override fun getCount(): Int {
        return data.size
    }

    fun setData(data: ArrayList<Fragment>) {
        this.data.clear()
        this.data.addAll(data)
        notifyDataSetChanged()
    }

    fun appendFragment(fragment: Fragment): HomeTabAdapter {
        data.add(fragment)
        notifyDataSetChanged()
        return this
    }

    fun updateFragment(position: Int) {
        (data[position] as BaseFragment<*>).notifyInitData()
    }

    fun broadcast(pos: Int) {
        if (data.size > pos)
            (data[pos] as BaseFragment<*>).broadcast()
    }

    fun broadcast() {
        for (i in 0 until data.size)
            (data[i] as BaseFragment<*>).broadcast()
    }

    override fun getPageTitle(position: Int): CharSequence? {
        return when {
            titles.isNullOrEmpty() -> super.getPageTitle(position)
            titles.size < position -> {
                super.getPageTitle(position)
            }
            else -> {
                titles[position]
            }
        }
    }
}