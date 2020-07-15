import 'package:flutter/material.dart';
import 'package:weplan_sdk/weplan_sdk.dart';

class SdkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text("Enable SDK"),
        onPressed: () { WeplanSdk.enableSdk(); }
      ),
    );
  }
}