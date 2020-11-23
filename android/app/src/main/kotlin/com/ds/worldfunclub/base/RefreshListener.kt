package com.ds.worldfunclub.base

import androidx.swiperefreshlayout.widget.SwipeRefreshLayout

interface RefreshListener {
    fun refresh(r:SwipeRefreshLayout)
}