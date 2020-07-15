import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:weplan_sdk_example/sdk_screen.dart';

void main() {
  runApp(MyApp());
}

/// Example Flutter Application demonstrating the functionality of the
/// Permission Handler plugin.

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
        return PermissionsScreen();
      case 1:
        return SdkScreen();
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

class PermissionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
          children: Permission.values
              .where((Permission permission) {
            if (Platform.isIOS) {
              return permission != Permission.unknown &&
                  permission != Permission.sms &&
                  //permission != Permission.storage &&
                  permission != Permission.ignoreBatteryOptimizations &&
                  permission != Permission.accessMediaLocation;
            } else {
              return permission != Permission.unknown &&
                  permission != Permission.mediaLibrary &&
                  permission != Permission.photos &&
                  permission != Permission.reminders;
            }
          })
              .map((permission) => PermissionWidget(permission))
              .toList()),
    );
  }

}

/// Permission widget which displays a permission and allows users to request
/// the permissions.
class PermissionWidget extends StatefulWidget {
  /// Constructs a [PermissionWidget] for the supplied [Permission].
  const PermissionWidget(this._permission);

  final Permission _permission;

  @override
  _PermissionState createState() => _PermissionState(_permission);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permission);

  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.undetermined;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_permission.toString()),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      trailing: IconButton(
          icon: const Icon(Icons.info),
          onPressed: () {
            checkServiceStatus(context, _permission);
          }),
      onTap: () {
        requestPermission(_permission);
      },
    );
  }

  void checkServiceStatus(BuildContext context, Permission permission) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text((await permission.status).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }
}