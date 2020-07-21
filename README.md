
# weplan_sdk
A library for using weplan's SDK.
***Only supported on Android currently.

### Usage

**Prerequisite:** ACCESS_FINE_LOCATION must be granted.

Enable:

    WeplanSdk.enableSdk(API_CLIENT_ID, API_CLIENT_SECRET);

Disable:

    WeplanSdk.disableSdk();


## Installing: Use this package as a library
### 1. Depend on it

Add this to your package's pubspec.yaml file:


    dependencies:
      weplan_sdk:
          git: git@github.com:weplan-analytics/weplan-sdk-flutter-plugin.git


### 2. Install it

You can install packages from the command line:

with pub:


    $ pub get


with Flutter:


    $ flutter pub get


Alternatively, your editor might support pub get or flutter pub get. Check the docs for your editor to learn more.

### 3. Import it

Now in your Dart code, you can use:


    import 'package:weplan_sdk/weplan_sdk.dart';

