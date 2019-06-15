# flutter_barcode example
- This example will not work on emulators, you will need a real android/ios device to test.
- add the library [Barcode Scanner](https://pub.dev/packages/barcode_scan) to the file `pubspec.yaml`
- Android setup
    - create the flutter project with kotlin support as the plugin is written in kotlin
    - Add camera permission to the file  `androd/app/src/profile/AndroidManifest.xml`
        ```xml
        <uses-permission android:name="android.permission.CAMERA" />
        ```
    - add the plugin activity to `androd/app/src/main/AndroidManifest.xml`
        ```xml
        <!-- Get this line from the plugin documents as it might change in the future -->
        <activity android:name="com.apptreesoftware.barcodescan.BarcodeScannerActivity"/>
        ```
    - Also the `barcode_scan` require to upgrade the gradle and kotlin versions in `android/buid.gradle` file
        ```
        buildscript {
            ...
            ext.kotlin_version = '1.3.0'
            ...
            dependencies {
               classpath 'com.android.tools.build:gradle:3.3.1'
            }
        }
        ``` 
- IOS setup
    - add camera permission to `ios/Runner/info.plist`
    ```xml
    <dict>
      ...
      <key>NSCameraUsageDescription</key>
      <string>Camera permission is required for barcode scanning.</string>
      ...
    </dict>
    ```