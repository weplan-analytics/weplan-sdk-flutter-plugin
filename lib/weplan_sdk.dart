import 'dart:async';

import 'package:flutter/services.dart';

class WeplanSdk {
  static const MethodChannel _channel =
      const MethodChannel('weplan_sdk');

  static enableSdk(String clientId, String clientSecret) {
    _channel.invokeMethod('enableSdk', <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
    });
  }

  static disableSdk() {
    _channel.invokeMethod('disableSdk');
  }
}
