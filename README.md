![image](https://user-images.githubusercontent.com/61788924/89123513-9f5e4000-d4d8-11ea-9025-653c9f290ed8.png)

# **Welcome to AppsFlyer SDK 6.x**

>‼️ The sample app is cmpatible with the IDFA limitations in iOS 14.5

iOS 14.5 blocks the collection of IDFA unless the user allows ita collection when the application starts. 

AppsFlyer's SDK - starting of version 6.0.3 - supports this functionality using Apple's AppTrackingTransperancy framework. 

This sample app will allow you to test this functionality and ensure that your app is running smoothly ahead of the release of iOS 14.

## Compatability
- **iOS version >= 10.0**

- **AppsFlyer SDK version 6.0.3 (current installed SDK is 6.2.2)**

## How do I test consent to collect of IDFA?

When the application initialises in iOS 14:

<img src="https://user-images.githubusercontent.com/61788924/89154579-cd429380-d56f-11ea-96be-0a39e2bf1350.png" alt="idfa_menu" width="320" />

This code shows a menu that requests the user to authorise IDFA collection.

```swift
// The following block is optional for applications wishing to give users the option to collect IDFA.
// for iOS 14 and above - The user may be prompted to collect IDFA.
//                        If user opts-in, the IDFA will be collected by the SDK.
// for iOS 13 and below - The IDFA will be collected by the SDK. The user will NOT be prompted to consent.
if #available(iOS 14, *) {
  // Set a timeout for the SDK to wait for the IDFA collection before handling app launch
  // If timeout expires before the user allows to collect IDFA , the IDFA will NOT be collected.
  AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: 60)
  // Show the user the Apple IDFA consent dialog (AppTrackingTransparency)
  // MUST be called here before start() in order to allow IDFA collection by the SDK
  ATTrackingManager.requestTrackingAuthorization { (status) in
                                                 }
}
```
[Get code here](https://github.com/AppsFlyerSDK/appsflyer-sdk-v6-sample-app/blob/master/swift/sdk-v6-demo/sdk-v6-demo/AppDelegate.swift#L37-L49)

In the app you have a button '**Test IDFA collection**'

#### If user authorised IDFA collection, its IDFA will be displayed
<img src="https://user-images.githubusercontent.com/61788924/89342813-ff591000-d6ab-11ea-9a90-2cae9810794b.png" alt="idfa_ok" width="350" />

#### If user DID NOT authorise IDFA collection, a message will be displayed

<img src="https://user-images.githubusercontent.com/61788924/89152971-acc50a00-d56c-11ea-9198-6b3af746be10.png" alt="idfa_not_allowed" width="350" />

## Why is the demo app asking me to allow notifications?

The notifcations are used for the uninstall detection flow

## How to use this demo?

1. Clone the repository
2. **Make sure to open the work environment via Xcode workspace `basic_app.xcworkspace`**
3. Get your AppsFlyer Dev Key using [these instructions][get_af_devkey].
4. Create the file `sdk-v6-demo/afdevkey_donotpush.plist` with the following content:
```xml
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
        <key>appsFlyerDevKey</key>
        <string>YOUR_AF_DEV_KEY_HERE</string>
        <key>appleAppID</key>
        <string>YOUR_APPLE_APP_ID_HERE</string>
</dict>
</plist>
```
5. Add the file into your Xcode project
> The file `sdk-v6-demo/sdk-v6-demo.xcodeproj/project.pbxproj` will have some changes. **Do not commit them!**

[get_af_devkey]: https://support.appsflyer.com/hc/en-us/articles/207032066-iOS-SDK-integration-for-developers#integration-31-retrieving-your-dev-key
