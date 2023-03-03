package com.codetron.test_method_channel

import android.annotation.SuppressLint
import android.provider.Settings.Secure
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.codetron/serial"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if(call.method == "getDevSerial"){
                result.success(getDevSerial())
            }
        }
    }

    @SuppressLint("HardwareIds")
    private fun getDevSerial(): String {
        return Secure.getString(
            context.contentResolver,
            Secure.ANDROID_ID)
    }

}
