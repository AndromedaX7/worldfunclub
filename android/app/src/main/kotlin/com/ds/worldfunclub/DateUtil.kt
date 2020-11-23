package com.ds.worldfunclub

import java.text.DateFormat
import java.text.ParseException
import java.text.SimpleDateFormat
import java.util.*

object DateUtil {
    fun parseDate(patten: String, date: String): Long {
        val d: DateFormat = SimpleDateFormat(patten)
        d.timeZone = TimeZone.getTimeZone("GMT")
        try {
            return d.parse(date).time
        } catch (e: ParseException) {
            e.printStackTrace()
        }
        return 0
    }

    fun format(patten: String, date: Long): String {
        val d: DateFormat = SimpleDateFormat(patten)
        d.timeZone = TimeZone.getTimeZone("GMT")
        return d.format(Date(date))
    }
}

fun String.toDateMillis(patten: String): Long {
    return DateUtil.parseDate(patten, this)
}

fun Long.toDateString(patten: String): String {
    return DateUtil.format(patten, this)
}