package com.ds.worldfunclub.base;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ViewDataBinding;
import androidx.fragment.app.Fragment;

import com.ds.worldfunclub.BR;
import com.ds.worldfunclub.app.App;
import com.ds.worldfunclub.di.component.AppComponent;

import javax.inject.Inject;

public abstract class BaseFragment<VM extends BaseModel> extends Fragment {

    @Inject
    protected VM vm;
    protected ViewDataBinding binding;


    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        binding = DataBindingUtil.inflate(inflater, layoutId(), container, false);
        binding.setVariable(BR.ac, requireActivity());
        binding.setVariable(BR.vm, vm);
        return binding.getRoot();
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        Log.e("tab", vm == null ? "vm is null" : vm.toString());
        initReady();
    }

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        init(((App) (requireActivity().getApplication())).getAppComponent());
    }

    public abstract int layoutId();

    public abstract void init(AppComponent appComponent);

    protected void initReady() {
        vm.onReady();
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        vm.onActivityResult(requestCode, resultCode, data);
    }

    @Override
    public void onResume() {
        super.onResume();
        vm.onResume();
    }

    public void notifyInitData() {

    }

    public void broadcast() {
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        vm.onRequestPermissionsResult(requestCode, permissions, grantResults);
    }
}
