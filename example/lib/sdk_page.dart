import 'package:flutter/material.dart';
import 'package:weplan_sdk/weplan_sdk.dart';

class SdkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Enable SDK"),
              onPressed: () { WeplanSdk.enableSdk(); }
          ),
          FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Disable SDK"),
              onPressed: () { WeplanSdk.disableSdk(); }
          ),
        ],
      )
    );
  }
}