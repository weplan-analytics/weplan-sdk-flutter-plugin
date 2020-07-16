package com.cumberland.weplan_sdk

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull;
import com.cumberland.weplansdk.WeplanSdk

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** WeplanSdkPlugin */
public class WeplanSdkPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context
  private lateinit var activity: Activity

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "weplan_sdk")
    channel.setMethodCallHandler(this);
    context = flutterPluginBinding.applicationContext
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "weplan_sdk")
      channel.setMethodCallHandler(WeplanSdkPlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "enableSdk") {
      enableSdk(context)
    }
    else if (call.method == "disableSdk") {
      disableSDK(context)
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onDetachedFromActivity() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  // TODO these are coverage+ IDs, use different? Put in build.config
  val API_CLIENT_ID = "mLjamj5RzzNeHRMY9jTpstsKduTGiRrY69Wi55yDqwNBHYsPNwGKj3w6HedG1l1NvkuexTNPvT0j52thhtqnU1"
  val API_CLIENT_SECRET = "Q0IRLVPdunhApbZGqSQBrvmNbCoOucaY7sRuwPuoBHnhFhrvbJoMfWOvqlfBKTCDWtOSGNuurcQVIBWmZBTnzF"

  fun enableSdk(context: Context) {
    WeplanSdk.withContext(context)
            .withClientId(API_CLIENT_ID)
            .withClientSecret(API_CLIENT_SECRET)
            .enable()
  }

  fun disableSDK(context: Context) {
    WeplanSdk.disable(context)
  }
}