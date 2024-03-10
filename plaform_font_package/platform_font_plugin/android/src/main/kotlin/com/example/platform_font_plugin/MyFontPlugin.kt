package com.example.platform_font_plugin

import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


import android.graphics.Typeface
import android.os.Build
import androidx.core.provider.FontRequest
import androidx.core.provider.FontsContractCompat
import androidx.core.provider.FontsContractCompat.FontRequestCallback

class MyFontPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "my_font_plugin")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "getSystemFont" -> getSystemFont(context) { font ->
                result.success(font)
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }


   private fun getSystemFont(context: Context, callback: (String) -> Unit) {
        val fontProviderAuthority = "com.google.android.gms.fonts"
        val packageName = "com.google.android.gms"
        val query = "name=Roboto" // Change this to the desired font query
        val fontRequest = FontRequest(
            fontProviderAuthority,
            packageName,
            query,
            R.array.com_google_android_gms_fonts_certs
        )
    
        val fontCallback = object : FontRequestCallback() {
            override fun onTypefaceRetrieved(typeface: Typeface) {
                // Typeface retrieved, get the font family
                val fontFamilies = FontsContractCompat.getFontFamily(context, fontRequest)
                val fontFamily = fontFamilies?.firstOrNull()?.name
                callback(fontFamily ?: "Roboto") // Return font family, defaulting to "Roboto" if not found
            }
    
            override fun onTypefaceRequestFailed(reason: Int) {
                // Request failed, handle error
                callback("Roboto") // Return default font family on failure
            }
        }
    
        // Check if the platform version is at least O (26)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            FontsContractCompat.requestFont(context, fontRequest, fontCallback, null)
        }
    }
}

