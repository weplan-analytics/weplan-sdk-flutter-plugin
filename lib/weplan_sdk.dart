import 'dart:async';

import 'package:flutter/services.dart';

class WeplanSdk {
  static const MethodChannel _channel =
      const MethodChannel('weplan_sdk');

  static enable() {
    _channel.invokeMethod('enableSdk');
  }

  static enableSdk(String clientId, String clientSecret) {
    _channel.invokeMethod('enableSdkParams', <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret
    });
  }

  static disable() {
    _channel.invokeMethod('disableSdk');
  }
}
