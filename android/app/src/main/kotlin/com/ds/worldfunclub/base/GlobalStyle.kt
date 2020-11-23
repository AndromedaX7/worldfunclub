package com.ds.worldfunclub.base

enum class GlobalStyle(val value: Int) {
    Default(0),
    MaterialDesign(1);

    companion object {
        fun valueOf(styleId: Int): GlobalStyle {
            return when (styleId) {
                1 -> MaterialDesign
                else ->
                    Default
            }
        }
    }
}