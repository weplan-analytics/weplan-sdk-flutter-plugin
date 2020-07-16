import 'dart:async';

import 'package:flutter/services.dart';

class WeplanSdk {
  static const MethodChannel _channel =
      const MethodChannel('weplan_sdk');

  static enableSdk() {
    _channel.invokeMethod('enableSdk');
  }

  static disableSdk() {
    _channel.invokeMethod('disableSdk');
  }
}
