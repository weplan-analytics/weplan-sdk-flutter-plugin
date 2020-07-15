import 'dart:async';

import 'package:flutter/services.dart';

class WeplanSdk {
  static const MethodChannel _channel =
      const MethodChannel('weplan_sdk');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
