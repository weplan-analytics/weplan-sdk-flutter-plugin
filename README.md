
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
allprojects {
    repositories {
        maven {
            url "https://maven.weplananalytics.com/artifactory/partner"
            credentials(HttpHeaderCredentials) {
                name = "Authorization"
                value = "Bearer eyJ2ZXIiOiIyIiwidHlwIjoiSldUIiwiYWxnIjoiUlMyNTYiLCJraWQiOiJCNF84YVl5S2EzNlhldkwyN0F2NlM1UmlILVRFeVAzeERtSGdXc2luMEQ4In0.eyJzdWIiOiJqZnJ0QDAxZHQ0bWE3OXNrZHg5MWpmdzczMGgwbmttXC91c2Vyc1wvc2VyZ2lvLmxvcGV6QHdlcGxhbmFuYWx5dGljcy5jb20iLCJzY3AiOiJtZW1iZXItb2YtZ3JvdXBzOmRlZmF1bHQgYXBpOioiLCJhdWQiOiJqZnJ0QDAxZHQ0bWE3OXNrZHg5MWpmdzczMGgwbmttIiwiaXNzIjoiamZydEAwMWR0NG1hNzlza2R4OTFqZnc3MzBoMG5rbVwvdXNlcnNcL3BvcnRhbC1tYW5hZ2VyIiwiaWF0IjoxNjI2NDQ5MzM0LCJqdGkiOiI4YTlkMDM0NC0wMjcwLTRjOTUtYjI0Mi1hMzg1MWY3NDc1YTQifQ.MSKnZMdqxYSevKzSmqf78rVq30XgJngMM-HSYzFlB_vl9gPfw2RwigBv7iFOmtyTOHNPr_7TXITElY1Px9Xr378hctKPhuE4olrWmSCq9AcITvnBp_kUY5CChn5L3huekBJEK8yekgJrEFb6jsIFQyMb2wLzUvwzPTRcHI_4EDrOHrcJdzhaHmVTfAEarp2kFgeLXkA78dktH3P5lG-pjEAqehOZ4efgAErMKxh5ztZ9NMNtZ2th4XH8b4UREbEtLJirhx_QwfrsPK5aIMp8t_vyFwnYam3rRqqKAsTYlliyYbxUO1EaknTr7KUsP28PTyuPHYW3ejahw338An0F9w\""
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

