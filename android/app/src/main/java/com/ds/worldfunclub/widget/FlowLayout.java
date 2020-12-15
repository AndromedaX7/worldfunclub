package com.ds.worldfunclub.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

public class FlowLayout extends ViewGroup {
    public FlowLayout(Context context) {
        super(context);
    }

    public FlowLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public FlowLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public FlowLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int count = getChildCount();
        int totalHeight = getPaddingTop();
        int maxViewHeight = 0;
        int currentWidth = getPaddingLeft();
        Log.e(TAG, "onLayout: l:" + l + "==t:" + t + "==r:" + r + "==b:" + b);
        for (int i = 0; i < count; i++) {
            View view = getChildAt(i);
            int viewWidth = view.getMeasuredWidth() ;
            int viewHeight = view.getMeasuredHeight() ;
            MarginLayoutParams p = (MarginLayoutParams) view.getLayoutParams();
            if (currentWidth + viewWidth +p.leftMargin+p.rightMargin> r-getPaddingRight()-getPaddingLeft()) {
                currentWidth = getPaddingLeft();
                totalHeight += maxViewHeight;
//                totalHeight += p.topMargin+p.bottomMargin;
                view.layout(currentWidth + p.leftMargin, totalHeight + p.topMargin, currentWidth + viewWidth + p.rightMargin+ p.leftMargin, totalHeight + viewHeight + p.bottomMargin+ p.topMargin);
                currentWidth += viewWidth + p.rightMargin+p.leftMargin;
            } else {
                view.layout(currentWidth + p.leftMargin, totalHeight + p.topMargin, currentWidth + viewWidth + p.rightMargin+ p.leftMargin, totalHeight + viewHeight + p.bottomMargin+ p.topMargin);
                currentWidth += viewWidth + p.rightMargin+p.leftMargin;
            }
            maxViewHeight = Math.max(viewHeight+p.topMargin+p.bottomMargin, maxViewHeight);

        }
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        measureChildren(widthMeasureSpec, heightMeasureSpec);
        int top =getPaddingTop();
        int bottom = getPaddingBottom();

        int measureWidth = MeasureSpec.getSize(widthMeasureSpec);
        int measureHeight = MeasureSpec.getSize(heightMeasureSpec);
        int measureWidthMode = MeasureSpec.getMode(widthMeasureSpec);
        int measureHeightMode = MeasureSpec.getMode(heightMeasureSpec);


        int l= 0;
        int t=0;
        int count = getChildCount();
        int totalHeight = 0;
        int maxViewHeight = 0;
        int currentWidth = 0;

//        Log.e(TAG, "onLayout: l:" + l + "==t:" + t + "==r:" + measureWidth + "==b:" + b);
        for (int i = 0; i < count; i++) {
            View view = getChildAt(i);

            MarginLayoutParams lp = (MarginLayoutParams) view.getLayoutParams();
            measureChild(view,widthMeasureSpec,heightMeasureSpec);
            int viewWidth = view.getMeasuredWidth()+lp.leftMargin+lp.rightMargin;
            int viewHeight = view.getMeasuredHeight()+lp.topMargin+lp.bottomMargin;
            if (currentWidth + viewWidth > measureWidth-getPaddingRight()-getPaddingLeft()) {
                currentWidth = getPaddingLeft();
                totalHeight += maxViewHeight;
//                totalHeight += p.topMargin;
            }
                currentWidth +=( viewWidth  );

            maxViewHeight = Math.max(viewHeight, maxViewHeight);

        }

        Log.e("Width","measureWidth"+measureWidth);
        Log.e("Width","measureHeight"+(totalHeight+maxViewHeight));
        setMeasuredDimension(  measureWidth  , (measureHeightMode == MeasureSpec.EXACTLY) ? measureHeight :top+bottom+ totalHeight+maxViewHeight);
    }

    @Override
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams lp) {
        return new MarginLayoutParams(lp);
    }

    @Override
    public LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new MarginLayoutParams(getContext(), attrs);
    }

    @Override
    protected LayoutParams generateDefaultLayoutParams() {
        return new MarginLayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT);
    }

    private final String TAG = "FlowLayout";
}