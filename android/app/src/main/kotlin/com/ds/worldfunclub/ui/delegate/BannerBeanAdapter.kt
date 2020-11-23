package com.ds.worldfunclub.ui.delegate

import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.BindingDelegate2
import com.ds.worldfunclub.base.MultiTypeAdapter

class BannerBeanAdapter : MultiTypeAdapter<Boolean>() {
    init {
        addDelegate(BannerBeanDelegate())
    }

    fun createdByCount(count: Int) {
        clear()
        for (i in 0 until count) {
            data.add(false)
        }
        notifyItemRangeChanged(0, count)
    }


    // pos in 0 .. data -> size  to pos
    // pos -1 reset
    fun selectedPos(pos: Int) {
        if (pos == -1) {
            notifyDataSetChanged()
            (delegates[0] as BannerBeanDelegate).selectedPos(0)
        } else {
            (delegates[0] as BannerBeanDelegate).selectedPos(pos)

            when (data.size) {
                0 -> {
                }
                1 -> {
                    notifyItemChanged(0)
                }
                2 -> {
                    notifyItemMoved(0, 1)
//                notifyItemChanged(0)
//                notifyItemChanged(1)
                }
                else -> {
                    when (pos) {
                        0 -> {
                            notifyItemMoved(data.size - 1, pos)
//                        notifyItemChanged(data.size - 1)
//                        notifyItemChanged(pos)
                        }
                        in 1 until data.size -> {
//                        notifyItemChanged(pos - 1)
//                        notifyItemChanged(pos)

                            notifyItemMoved(pos - 1, pos)
                        }
                    }
                }
            }
        }
    }

    class BannerBeanDelegate : BindingDelegate2<Boolean>() {
        var pos = 0
        override fun layoutId(): Int {
            return R.layout.item_banner_bean
        }

        fun selectedPos(pos: Int) {
            this.pos = pos
        }

    }
}

