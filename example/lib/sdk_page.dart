import 'package:flutter/material.dart';
import 'package:weplan_sdk/weplan_sdk.dart';

class SdkPage extends StatelessWidget {
  var API_CLIENT_ID = "fGthbeJ9tru8CDlQUqhKmLXDxwXWzQLxfSjwEeoJ1iWTS9dLNRfIF295LEFwV3dGx53FhY2Oj9m1SDWDoeDhcA";
  var API_CLIENT_SECRET = "Youbgyj54SbfMjMcFSCWjAzSDKk8GzJc2VP7DTqWR8LhuqNhb29rOfDOb9GNS0FUhMFtBiKlNqmXVCjMjk3U8u";

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
              onPressed: () { WeplanSdk.enable(API_CLIENT_ID, API_CLIENT_SECRET, true); }
          ),
          FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Disable SDK"),
              onPressed: () { WeplanSdk.disable(); }
          ),
        ],
      )
    );
  }
}