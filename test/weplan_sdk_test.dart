import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weplan_sdk/weplan_sdk.dart';

void main() {
  const MethodChannel channel = MethodChannel('weplan_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await WeplanSdk.platformVersion, '42');
  });
}
