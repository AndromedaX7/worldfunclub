package com.ds.worldfunclub.base;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.databinding.BindingAdapter;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;
import androidx.viewpager2.widget.ViewPager2;

import com.bumptech.glide.Glide;
import com.bumptech.glide.load.resource.bitmap.CircleCrop;
import com.bumptech.glide.load.resource.bitmap.RoundedCorners;
import com.bumptech.glide.request.RequestOptions;
import com.ds.worldfunclub.R;
import com.ds.worldfunclub.network.OrderState;
import com.ds.worldfunclub.responsebean.CodeBarWrapper;

import java.io.File;


public class DataBindingAdapter {
    @BindingAdapter("img")
    public static void imageUrl(ImageView imageView, String url) {
        Glide.with(imageView).load(url).error(R.drawable.layer_bad_image).into(imageView);
    }

    @BindingAdapter("imgFile")
    public static void imageFile(ImageView imageView, File file) {
//        imageView.setImageBitmap(BitmapFactory.decodeFile(file.getAbsolutePath()));
        Glide.with(imageView).load(file).
                error(R.drawable.layer_bad_image).into(imageView);
    }

    @BindingAdapter("imgX")
    public static void imageMixUrl(ImageView imageView, String url) {

        try {
            int res = Integer.parseInt(url);
            Glide.with(imageView).load(res).error(R.drawable.layer_bad_image).into(imageView);
        } catch (NumberFormatException e) {
            Glide.with(imageView).load(url).error(R.drawable.layer_bad_image).into(imageView);
        }

    }

    @BindingAdapter("imgCircle")
    public static void imageUrl2(ImageView imageView, String url) {
        Glide.with(imageView).load(url)
                .apply(RequestOptions.bitmapTransform(new CircleCrop()))
                .into(imageView);
    }

    @BindingAdapter("imgRound")
    public static void imageUrl3(ImageView imageView, String url) {
        Glide.with(imageView).load(url)
                .error(R.drawable.layer_bad_image)
                .apply(RequestOptions.bitmapTransform(new RoundedCorners(20)))
                .into(imageView);
    }


    @BindingAdapter("check")
    public static void checkImage(ViewGroup view, boolean check) {
        view.setBackgroundResource(check ? R.drawable.shape_checked : R.drawable.shape_check_default);
        View checked = view.findViewById(R.id.checked);
        checked.setVisibility(check ? View.VISIBLE : View.GONE);
    }

    @BindingAdapter("img")
    public static void imageUrl(ImageView imageView, int res) {
        Glide.with(imageView).load(res).error(R.drawable.layer_bad_image).into(imageView);
    }

    @BindingAdapter("selectImg")
    public static void selectImageState(ImageView imageView, boolean selected) {
        imageView.setSelected(selected);
    }

//    @BindingAdapter("selectAndMask")
//    public static void selectImageState2(ImageView imageView, boolean selected) {
//        imageView.setSelected(selected);
//        if(selected){
//            Drawable drawable= imageView.getDrawable();
//            drawable.setColorFilter(new PorterDuffColorFilter(SkinManager.INSTANCE.getColor(R.color.colorToolbar),PorterDuff.Mode.SRC));
//
//        }
//    }

    @BindingAdapter("selectView")
    public static void selectImageState(View imageView, boolean selected) {
        imageView.setSelected(selected);
    }


    @BindingAdapter("adapter")
    public static void pageAdapter(ViewPager vp, PagerAdapter adapter) {
        vp.setAdapter(adapter);
    }

    @BindingAdapter("adapter")
    public static void pageAdapter(ViewPager2 vp, MultiTypeAdapter adapter) {
        vp.setAdapter(adapter);
    }

    @BindingAdapter("adapter")
    public static void setAdapter(RecyclerView vp, MultiTypeAdapter adapter) {
        vp.setAdapter(adapter);
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

    @BindingAdapter("status")
    public static void statusHeight(View view, Activity activity) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        params.height = getStatusBarHeight(activity);
        view.setLayoutParams(params);

    }

//    @BindingAdapter("orderState")
//    public static void orderState(TextView view, int state) {
//
//        String stateName = "";
//        switch (state) {
//            case 0:
//                stateName = "待付款";
//                break;
//            case 1:
//                stateName = "待发货";
//                break;
//            case 2:
//                stateName = "待收货";
//                break;
//            case 3:
//                stateName = "待评价";
//                break;
//            case 4:
//                stateName = "已完成";
//                break;
//            case 5:
//                stateName = "退款中";
//                break;
//            case 6:
//                stateName = "换货中";
//                break;
//
//        }
//        view.setText(stateName);
//    }

    @BindingAdapter("orderState")
    public static void orderState(TextView view, String state) {

        String stateName = "";
        switch (state) {

            case "10":
                stateName = "待付款";
                view.setText(stateName);
                break;
            case "20":
                stateName = "待发货";
                view.setText(stateName);
                break;
            case "30":
                stateName = "待收货";
                view.setText(stateName);
                break;
            case "40":
                stateName = "待评价";
                view.setText(stateName);
                break;
        }

    }

    @BindingAdapter("orderLiveState")
    public static void orderState2(TextView view, String state) {

        String stateName = "";
        switch (state) {

            case "10":
                stateName = "待付款";
                view.setText(stateName);
                break;
            case "20":
                stateName = "待使用";
                view.setText(stateName);
                break;
            case "30":
                stateName = "已使用";
                view.setText(stateName);
                break;
            case "40":
                stateName = "已过期";
                view.setText(stateName);
                break;
        }

    }

    //    @BindingAdapter("codeBar")
//    public static void getCodeBar(ImageView view, CodeBarWrapper wrapper) {
//        if (wrapper != null&& wrapper.getOrderState()!= OrderState.WillPay) {
//            view.setImageBitmap(Encoder.bitmap(wrapper.getBarcodeFormat(), wrapper.getCode(),  view.getContext().getResources().getColor(R.color.colorRefreshIndicator), Color.WHITE, 960, 480));
//            view.setVisibility(View.VISIBLE);
//        }else {
//            view.setVisibility(View.GONE);
//        }
//
//    }
    @BindingAdapter("qrcode")
    public static void getCodeBar2(ImageView view, CodeBarWrapper wrapper) {
        if (wrapper != null && wrapper.getOrderState() != OrderState.WillPay) {
            imageMixUrl(view, wrapper.getCode());
            view.setVisibility(View.VISIBLE);
        } else {
            view.setVisibility(View.GONE);
        }

    }

    public static int getStatusBarHeight(Activity activity) {
        Resources resources = activity.getResources();
        int resourceId = resources.getIdentifier("status_bar_height", "dimen", "android");
        return resources.getDimensionPixelSize(resourceId);
    }

    @BindingAdapter("deleteText")
    public static void delText(TextView text, String content) {
        text.setText(Html.fromHtml("<s>" + content + "</s>"));
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

    @BindingAdapter("webText")
    public static void wrapTextPlane(WebView v, String text) {
        WebViewExtKt.createSettings(v);
        WebViewExtKt.loadPlantText(v, text);
    }

    @BindingAdapter("max")
    public static void max(ProgressBar p, String max) {
        try {
            max(p, Integer.parseInt(max));
        } catch (NumberFormatException e) {
            max(p, Integer.MAX_VALUE);
        }
    }

    @BindingAdapter("max")
    public static void max(ProgressBar p, int max) {
        p.setMax(max);
    }


    @BindingAdapter("enabled")
    public static void enabled(View view, boolean enable) {
        view.setEnabled(enable);
    }


    @BindingAdapter("onLongClick")
    public static void onLongClick(View view, View.OnLongClickListener listener) {
        view.setOnLongClickListener(listener);
    }
}