import 'dart:async';

import 'package:flutter/services.dart';

class WeplanSdk {
  static const MethodChannel _channel =
      const MethodChannel('weplan_sdk');

  static enable(String clientId, String clientSecret, bool startOnAppUpdate) {
    _channel.invokeMethod('enableSdk', <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
      'startOnAppUpdate': startOnAppUpdate
    });
  }

  static disable() {
    _channel.invokeMethod('disableSdk');
  }
}
