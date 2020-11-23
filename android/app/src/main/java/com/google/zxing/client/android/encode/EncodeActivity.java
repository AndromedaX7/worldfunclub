/*
 * Copyright (C) 2008 ZXing authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.google.zxing.client.android.encode;

import android.app.Activity;
import android.app.AlertDialog;
import android.graphics.Color;
import android.graphics.Point;
import android.os.Bundle;
import android.view.Display;
import android.view.WindowManager;
import android.widget.ImageView;

import com.ds.worldfunclub.R;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.android.FinishListener;

/**
 * This class encodes data from an Intent into a QR code, and then displays it full screen so that
 * another person can scan it with their device.
 *
 * @author dswitkin@google.com (Daniel Switkin)
 */
public final class EncodeActivity extends Activity {


    @Override
    public void onCreate(Bundle icicle) {
        super.onCreate(icicle);
        setContentView(R.layout.encode);
    }


    @Override
    protected void onResume() {
        super.onResume();
        // This assumes the view is full screen, which is a good assumption
        WindowManager manager = (WindowManager) getSystemService(WINDOW_SERVICE);
        Display display = manager.getDefaultDisplay();
        Point displaySize = new Point();
        display.getSize(displaySize);
        int smallerDimension = 700;
        ImageView im = findViewById(R.id.image);
        im.setImageBitmap(Encoder.bitmap(BarcodeFormat.EAN_13,"012345678912", im.getContext().getResources().getColor(R.color.colorRefreshIndicator), Color.WHITE, 800, 400));

    }
//    Business background

    private void showErrorMessage(int message) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setMessage(message);
        builder.setPositiveButton(R.string.button_ok, new FinishListener(this));
        builder.setOnCancelListener(new FinishListener(this));
        builder.show();
    }
}
