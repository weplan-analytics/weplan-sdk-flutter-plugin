import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weplan_sdk_example/permissions_page.dart';
import 'package:weplan_sdk_example/sdk_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

class _MyAppState extends State<MyApp> {
  var _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget selectedDestination(int value) {
    switch (value) {
      case 0:
        return PermissionsPage();
      case 1:
        return SdkPage();
      default:
        throw Exception("Not implemented");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () async {
                var hasOpened = openAppSettings();
                debugPrint('App Settings opened: ' + hasOpened.toString());
              },
            )
          ],
        ),
        body: selectedDestination(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.perm_device_information),
              title: new Text('Permissions'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              title: new Text('Weplan SDK'),
            ),
          ],
        ),
      ),
    );
  }
}