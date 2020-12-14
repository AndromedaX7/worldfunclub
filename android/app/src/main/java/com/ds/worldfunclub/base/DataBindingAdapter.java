package com.ds.worldfunclub.base;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;

import androidx.databinding.BindingAdapter;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.ds.worldfunclub.R;


public class DataBindingAdapter {
    @BindingAdapter("img")
    public static void imageUrl(ImageView imageView, String url) {
        Glide.with(imageView).load(url).error(R.drawable.layer_bad_image).into(imageView);
    }

    @BindingAdapter("width")
    public static void width(View view, int size) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        layoutParams.width = dp2px(view.getContext(), size);
        view.setLayoutParams(layoutParams);
    }

    @BindingAdapter("height")
    public static void height(View view, int size) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        layoutParams.height = dp2px(view.getContext(), size);
        view.setLayoutParams(layoutParams);
    }


    @BindingAdapter("showStar")
    public static void showStar(LinearLayout layout, int starCount) {
        layout.removeAllViews();
        for (int i = 0; i < starCount; i++) {
            View star = LayoutInflater.from(layout.getContext()).inflate(R.layout.view_star, layout, false);
            layout.addView(star);
        }
    }


    @BindingAdapter("showStar")
    public static void showStar(LinearLayout layout, String starCount) {
        try {
            int num = Integer.parseInt(starCount);
            showStar(layout, num);
        } catch (NumberFormatException e) {
            showStar(layout, 4);
        }

    }

    public static int dp2px(Context context, int dpValue) {
        final float scale = context.getResources().getDisplayMetrics().density;
        return (int) (dpValue * scale + 0.5f);
    }


    @BindingAdapter("loadMore")
    public static void loadMore(RecyclerView rv, BaseModel model) {
        ExtensionsKt.loadMore(rv, model.getLoadStateProp(), model.getLoadMoreProp());
    }

    @BindingAdapter("enabled")
    public static void enabled(View view, boolean enable) {
        view.setEnabled(enable);
    }


}