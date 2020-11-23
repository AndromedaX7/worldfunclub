package com.ds.worldfunclub.ui.dialog


import android.app.Dialog
import android.content.Context
import android.content.DialogInterface
import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.view.LayoutInflater
import android.view.View
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView
import com.ds.worldfunclub.R


class AlertDialog constructor(val c: Context) :
    Dialog(c, R.style.IOSDialogStyle) {


    private var onOption1Click: DialogInterface.OnClickListener? = null
    private var onOption2Click: DialogInterface.OnClickListener? = null

    private val rootView = LayoutInflater.from(c).inflate(R.layout.dialog_ios, null, false)

    init {
        window?.setBackgroundDrawable(
            ColorDrawable(0)
        )

        window?.setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        )
        setContentView(rootView/*R.layout.dialog_ios*/)
        rootView.findViewById<FrameLayout>(R.id.dismiss).setOnClickListener {
            dismiss()
        }
    }

    fun setTitle(title: String): AlertDialog {
        val wrap = rootView.findViewById<LinearLayout>(R.id.ios_title_wrap)
        val textView = rootView.findViewById<TextView>(R.id.ios_title)
        wrap?.visibility = View.VISIBLE
        textView?.text = title
        return this
    }

    fun setOnOption1Click(text: String, opt1: DialogInterface.OnClickListener): AlertDialog {

        val wrap = rootView.findViewById<LinearLayout>(R.id.ios_option1_wrap)
        wrap?.visibility = View.VISIBLE
        this.onOption1Click = opt1

        val option = rootView.findViewById<TextView>(R.id.ios_option1)
        option?.text = text
        option?.setOnClickListener {
            onOption1Click?.onClick(this, it.id)
            dismiss()
        }

        return this
    }

    fun setOnOption2Click(text: String, opt2: DialogInterface.OnClickListener): AlertDialog {
        this.onOption2Click = opt2
        val option = rootView.findViewById<TextView>(R.id.ios_option2)
        option?.visibility = View.VISIBLE
        option?.text = text
        option?.setOnClickListener {
            onOption2Click?.onClick(this, it.id)
            dismiss()
        }
        return this
    }

    fun withCancel(): AlertDialog {
        val cancel = rootView.findViewById<TextView>(R.id.ios_cancel)
        cancel?.visibility = View.VISIBLE
        cancel.setOnClickListener {
            dismiss()
        }
        return this
    }


    fun setTitle(title: String, textColor: Int): AlertDialog {

//        rootView.
        val wrap = rootView.findViewById<LinearLayout>(R.id.ios_title_wrap)
        val textView = rootView.findViewById<TextView>(R.id.ios_title)
        textView?.setTextColor(textColor)
        wrap?.visibility = View.VISIBLE
        textView?.text = title
        return this
    }

    fun setOnOption1Click(
            text: String,
            textColor: Int,
            opt1: DialogInterface.OnClickListener
    ): AlertDialog {

        val wrap = rootView.findViewById<LinearLayout>(R.id.ios_option1_wrap)
        wrap?.visibility = View.VISIBLE
        this.onOption1Click = opt1

        val option = rootView.findViewById<TextView>(R.id.ios_option1)
        option?.text = text
        option.setTextColor(textColor)
        option?.setOnClickListener {
            onOption1Click?.onClick(this, it.id)
            dismiss()
        }

        return this
    }

    fun setOnOption2Click(
        text: String,
        textColor: Int,
        opt2: DialogInterface.OnClickListener
    ): AlertDialog {
        this.onOption2Click = opt2
        val option = rootView.findViewById<TextView>(R.id.ios_option2)
        option?.visibility = View.VISIBLE
        option?.text = text
        option.setTextColor(textColor)
        option?.setOnClickListener {
            onOption2Click?.onClick(this, it.id)
            dismiss()
        }
        return this
    }

    fun withCancel(textColor: Int): AlertDialog {
        val cancel = rootView.findViewById<TextView>(R.id.ios_cancel)
        cancel.setTextColor(textColor)
        cancel?.visibility = View.VISIBLE
        cancel.setOnClickListener {
            dismiss()
        }
        return this
    }

    override fun show() {
        super.show()
        window?.setDimAmount(0f)
    }
}