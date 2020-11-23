package com.ds.worldfunclub.ui.dialog

import android.app.AlertDialog
import android.app.Dialog
import android.content.Context
import android.content.DialogInterface
import android.content.res.Resources
import android.util.TypedValue
import android.view.LayoutInflater
import android.widget.LinearLayout
import android.widget.TextView
import androidx.annotation.StyleRes
import com.ds.worldfunclub.R

class SimpleDialog constructor(c: Context) :
    Dialog(c,resolveDialogTheme(c )) {

    private val root: LinearLayout =
        LayoutInflater.from(c).inflate(R.layout.dialog_simple, null, false) as LinearLayout


    init {
        setContentView(root)
    }

    fun setTitle(text: String): SimpleDialog {
        val title = root.findViewById<TextView>(R.id.title)
        title.text = text
        return this
    }

    fun setContent(text: String): SimpleDialog {
        val content = root.findViewById<TextView>(R.id.content)
        content.text = text
        return this
    }

    fun onConfirm(text: String, confirmListener: DialogInterface.OnClickListener): SimpleDialog {
        val confirm = root.findViewById<TextView>(R.id.confirm)
        confirm.text = text
        confirm.setOnClickListener {
            confirmListener.onClick(null, it.id)
            dismiss()
        }
        return this
    }

    fun onCancel(cancelListener: DialogInterface.OnClickListener): SimpleDialog {
        val cancel = root.findViewById<TextView>(R.id.cancel)
        cancel.setOnClickListener {
            cancelListener.onClick(null, it.id)
            dismiss()
        }
        return this
    }

   companion object{
       @StyleRes
       fun resolveDialogTheme(context: Context): Int {

           val outValue = TypedValue()
           context.theme.resolveAttribute(R.attr.alertDialogTheme, outValue, true)
           return   outValue.resourceId

       }
   }
}