
# weplan_sdk
A library for using Weplan SDK.
***Only supported on Android.



## Installing: Use this package as a library

### 1. Install plugin

Add this dependency to your package's pubspec.yaml file:

    dependencies:
      weplan_sdk:
          git: https://github.com/weplan-analytics/weplan-sdk-flutter-plugin.git


Install package from the command line:

    $ flutter pub get

Copy this snippet at the end of *build.gradle* file from the app module of the Android application

```
allprojects {
    repositories {
        maven {
            url "https://maven.weplananalytics.com/artifactory/partner"
            credentials(HttpHeaderCredentials) {
                name = "Authorization"
                value = "Bearer YOUR_ACCESS_TOKEN" // Check it at https://sdk.weplananalytics.com/
            }
            authentication {
                header(HttpHeaderAuthentication)
            }
        }
    }
}
```

### 2. Use it

Now in your Dart code, you can use:

    import 'package:weplan_sdk/weplan_sdk.dart';

and enable the sdk

    WeplanSdk.enable("YOUR_CLIENT_ID", "YOUR_CLIENT_SECRET"); // Note that this will request location permission if it isn't granted

## FAQ
### Disable sdk

The SDK can be disabled at any time with the following command:

    WeplanSdk.disable();

