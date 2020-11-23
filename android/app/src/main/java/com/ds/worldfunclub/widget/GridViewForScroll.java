package com.ds.worldfunclub.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.GridView;

public class GridViewForScroll extends GridView {

    public GridViewForScroll(Context context) {
        super(context);
    }

    public GridViewForScroll(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public GridViewForScroll(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public GridViewForScroll(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int expandSpec = MeasureSpec.makeMeasureSpec(Integer.MAX_VALUE >> 2,
                MeasureSpec.AT_MOST);
        super.onMeasure(widthMeasureSpec, expandSpec);
    }
}
