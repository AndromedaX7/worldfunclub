package com.ds.worldfunclub.widget

import android.content.Context
import android.content.DialogInterface
import android.view.LayoutInflater
import androidx.databinding.DataBindingUtil
import com.ds.worldfunclub.R
import com.ds.worldfunclub.base.MultiTypeAdapter
import com.ds.worldfunclub.databinding.DialogAddressPickerBinding
import com.ds.worldfunclub.responsebean.AddressArea
import com.ds.worldfunclub.responsebean.AddressAreaWrap
import com.ds.worldfunclub.ui.delegate.AddressPickerDelegate
import com.google.android.material.bottomsheet.BottomSheetDialog
import com.google.android.material.tabs.TabLayout

class AddressPicker : BottomSheetDialog {
    lateinit var listener: AddressPickerListener
    val adapter = MultiTypeAdapter<AddressArea>()
    val view = DataBindingUtil.inflate<DialogAddressPickerBinding>(
            LayoutInflater.from(context),
            R.layout.dialog_address_picker,
            null,
            false
    )
    var selectPos = -1
    val delegate = AddressPickerDelegate(this)

    constructor(c: Context, listener: AddressPickerListener) : super(c) {
        this.listener = listener
        init()
    }

    constructor(c: Context, theme: Int) : super(c, theme) {
        init()
    }

    constructor(
            context: Context,
            cancelable: Boolean,
            cancelListener: DialogInterface.OnCancelListener
    ) : super(context, cancelable, cancelListener) {
        init()
    }


    lateinit var address: List<AddressArea>
    var selected0: AddressArea? = null
    var selected1: AddressArea? = null
    var selected2: AddressArea? = null

    var selected0Pos = -1
    var selected1Pos = -1
    var selected2Pos = -1
    private fun init() {
        address = AddressAreaWrap.fromAssets(context).data
        adapter.addDelegate(delegate)
    }

    fun created(): AddressPicker {
        view.vm = this
        val tabs = view.addressBar
        adapter.clear()
        adapter.addData2(ArrayList(address))
        tabs.addOnTabSelectedListener(object : TabLayout.OnTabSelectedListener {
            override fun onTabSelected(tab: TabLayout.Tab?) {
                tab?.let {
                    tabSelected(it)
                }
            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {
            }

            override fun onTabReselected(tab: TabLayout.Tab?) {
                tab?.let {
                    tabSelected(it)
                }
            }

        })
        val tab = tabs.newTab()
        tab.text = "请选择"
        tab.tag = "0"
        tabs.addTab(tab)
        setContentView(view.root)
        return this
    }

    fun tabSelected(tab: TabLayout.Tab) {
        val tabs = view.addressBar
        when (tab.tag) {
            "0" -> {
                selected2 = null
                selected1 = null
                selected0 = null
                adapter.clear()
                delegate.selected.set(selected0Pos)
                adapter.addData2(ArrayList(address))
                for (i in 1 until tabs.tabCount) {
                    tabs.removeTabAt(1)
                }
                val pos = tabs.getTabAt(0)
                pos?.text = "请选择"
                tabs.setScrollPosition(0, 0f, true)
            }
            "1" -> {
                adapter.clear()
                selected2 = null
                selected1 = null
                selected0?.children?.let {
                    delegate.selected.set(selected1Pos)
                    adapter.addData2(ArrayList(it))
                }

                for (i in 2 until tabs.tabCount) {
                    tabs.removeTabAt(2)
                }
                val pos = tabs.getTabAt(1)
                pos?.text = "请选择"
                tabs.setScrollPosition(1, 0f, true)
            }
            "2" -> {
                adapter.clear()
                selected2 = null
                selected1?.children?.let {
                    delegate.selected.set(selected2Pos)
                    adapter.addData2(ArrayList(it))
                }
                val pos = tabs.getTabAt(2)
                pos?.text = "请选择"

                tabs.setScrollPosition(2, 0f, true)
            }
        }


    }

    fun selectedArea(pos: Int, data: AddressArea) {
        for (i in adapter.data){
            i.isSelected=data.id == i.id
        }
        val tabs = view.addressBar
        if (selected0 == null) {
            selected0 = data
            selectPos = 0
            selected0Pos = pos
        } else if (selected1 == null) {
            selected1 = data
            selectPos = 1
            selected1Pos = pos
        } else   {
            selected2 = data
            selectPos = 2
            selected2Pos = pos
        }


        val tab = tabs.getTabAt(selectPos)
        tab?.text = data.name
        if (selectPos < 2) {
            val newTab = tabs.newTab()
            newTab.text = "请选择"
            newTab.tag = (selectPos + 1).toString()
            tabs.addTab(newTab)
            tabs.setScrollPosition(tabs.tabCount - 1, 0f, true)
            adapter.clear()
            when (selectPos) {
                0 -> {
                    delegate.selected.set(selected1Pos)
                }
                1 -> {
                    delegate.selected.set(selected2Pos)
                }
            }
            adapter.addData2(ArrayList(data.children))
        } else {
            listener.area(selected0!!, selected1!!, selected2!!)
            dismiss()
        }

    }

    companion object {
        fun create(c: Context, listener: AddressPickerListener): AddressPicker {
            return AddressPicker(c, listener).created()
        }
    }
}

interface AddressPickerListener {
    fun area(area1: AddressArea, area2: AddressArea, area3: AddressArea)
}