package com.example.flutter_qiniu_example;

import android.os.Bundle;

import com.example.flutter_qiniu.FlutterQiniuPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.imagepicker.ImagePickerPlugin;

/**
 * @author karma
 * @date 2020/7/24
 */
public class MainTestActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        FlutterQiniuPlugin.registerWith(registrarFor("plugins.xiaoenai.com/flutter_qiniu"));
        ImagePickerPlugin.registerWith(
                registrarFor("io.flutter.plugins.imagepicker.ImagePickerPlugin"));
    }
}
