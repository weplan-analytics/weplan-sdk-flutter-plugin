
# weplan_sdk
A library for using Weplan SDK.
***Only supported on Android.



## Installing: Use this package as a library

### 1. Install plugin

Add this dependency to your package's pubspec.yaml file:


    dependencies:
      weplan_sdk:
          git: git@github.com:weplan-analytics/weplan-sdk-flutter-plugin.git


Install package from the command line:

    $ flutter pub get


Copy this snippet at the end of *build.gradle* file from the app module of the Android application

```
repositories {
  maven { url 'https://maven.weplan-app.com/artifactory/public' }
}

android {
  defaultConfig {
    resValue "string", "WEPLAN_SDK_CLIENT_ID", "`YOUR_APP_CLIENT_ID"
    resValue "string", "WEPLAN_SDK_CLIENT_SECRET", "YOUR_APP_CLIENT_SECRET"
    resValue "bool", "WEPLAN_SDK_START_ON_APP_UPDATE", "true" // This will enable sdk on app updates to those devices with location permission previously granted
  }
  /* Add this only if you are using Android Gradle plugin 4.0.0 and higher on /android/build.gradle file
  dependenciesInfo {
    includeInApk = false
    includeInBundle = false
  }
  */
}
```

### 2. Use it

Now in your Dart code, you can use:

    import 'package:weplan_sdk/weplan_sdk.dart';

and enable the sdk

    WeplanSdk.enable();

## FAQ
### Disable sdk

The SDK can be disabled at any time with the following command:

    WeplanSdk.disable();

