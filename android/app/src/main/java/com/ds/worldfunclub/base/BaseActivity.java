package com.ds.worldfunclub.base;

import android.content.Intent;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.MenuItem;
import android.view.Window;

import androidx.annotation.ColorInt;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;

import com.alibaba.android.arouter.launcher.ARouter;
import com.ds.worldfunclub.BR;
import com.ds.worldfunclub.R;
import com.ds.worldfunclub.app.App;
import com.ds.worldfunclub.di.component.AppComponent;

import javax.inject.Inject;

public abstract class BaseActivity<VM extends BaseModel> extends AppCompatActivity {
    @Inject
    protected VM vm;
    private ViewDataBinding binding;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        requestWindowFeature(Window.FEATURE_CONTENT_TRANSITIONS);
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, layoutId());
        init(((App) (getApplication())).getAppComponent());
        binding.setVariable(BR.ac, this);
        binding.setVariable(BR.vm, vm);

//        Toolbar toolbar = findViewById(R.id.toolbar);
//        if (toolbar != null) {
//            setSupportActionBar(toolbar);
//        }
//        if (getSupportActionBar() != null) {
//            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
//            getSupportActionBar().setDisplayShowTitleEnabled(true);
//        }

        ARouter.getInstance().inject(this);
        initAnimate();
        initReady();
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                finishAfterTransition();
                break;
        }
        return true;
    }

    protected void initReady() {
        vm.onReady();
    }

    public abstract int layoutId();

    public abstract void init(AppComponent appComponent);

    public void initAnimate() {

    }

//    @Override
//    public void onThemeUpdate() {
//        super.onThemeUpdate();
//        if (needChangeStatusColor()) {
//            ExtensionsKt.transparentStatus(this, statusBarColor());
//            changeStatusColor();
//        }
//    }

    @Override
    protected void onResume() {
        super.onResume();
        vm.onResume();
//        Toolbar toolbar = findViewById(R.id.toolbar);
//        if (toolbar != null) {
//            try {
//                Field mTitleTextColor = Toolbar.class.getDeclaredField("mTitleTextColor");
//                mTitleTextColor.setAccessible(true);
//                ColorStateList csl = (ColorStateList) mTitleTextColor.get(toolbar);
//                setToolbarCustomTheme(this, csl.getDefaultColor());
//            } catch (NoSuchFieldException | IllegalAccessException e) {
//                e.printStackTrace();
//            }
//        }
//        if (needChangeStatusColor()){
//            ExtensionsKt.transparentStatus(this, statusBarColor());
//            changeStatusColor();
//        }

    }

//    private void setToolbarCustomTheme(AppCompatActivity activity, @ColorInt int colorInt) {
//        Drawable upArrow =
//                ContextCompat.getDrawable(activity, R.drawable.abc_ic_ab_back_material);
//        upArrow.setColorFilter(
////                        ContextCompat.getColor(activity, android.R.color.white),
//                colorInt,
//                PorterDuff.Mode.SRC_ATOP
//        );
//        if (activity.getSupportActionBar() != null) {
//            activity.getSupportActionBar().setHomeAsUpIndicator(upArrow);
//        }
//    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        vm.onActivityResult(requestCode, resultCode, data);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        vm.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }
}


