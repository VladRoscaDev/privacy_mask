package com.example.privacy_mask

import android.app.Activity
import android.view.WindowManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class PrivacyMaskPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel : MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "privacy_mask")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "setSecure") {
            val enable = call.arguments as? Boolean ?: false
            
            // This is the core logic for Android
            if (enable) {
                activity?.window?.addFlags(WindowManager.LayoutParams.FLAG_SECURE)
            } else {
                activity?.window?.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
            }
            
            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    // These methods are required by ActivityAware to get the Activity reference
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}