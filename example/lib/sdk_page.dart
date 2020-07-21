import 'package:flutter/material.dart';
import 'package:weplan_sdk/weplan_sdk.dart';

class SdkPage extends StatelessWidget {
  var API_CLIENT_ID = "mLjamj5RzzNeHRMY9jTpstsKduTGiRrY69Wi55yDqwNBHYsPNwGKj3w6HedG1l1NvkuexTNPvT0j52thhtqnU1";
  var API_CLIENT_SECRET = "Q0IRLVPdunhApbZGqSQBrvmNbCoOucaY7sRuwPuoBHnhFhrvbJoMfWOvqlfBKTCDWtOSGNuurcQVIBWmZBTnzF";

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
              onPressed: () { WeplanSdk.enableSdk(API_CLIENT_ID, API_CLIENT_SECRET); }
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