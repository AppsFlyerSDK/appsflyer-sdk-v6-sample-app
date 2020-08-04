![image](https://user-images.githubusercontent.com/61788924/89123513-9f5e4000-d4d8-11ea-9025-653c9f290ed8.png)

# **Welcome to AppsFlyer SDK 6.0 (currently beta)**

Using AppsFlyer SDK 6.0 beta is a key way for you to prepare for iOS 14. The SDK beta is compatible with the beta version of the iOS 14 and supports AppsFlyer's aggregate attribution (link to blog) and Apple's AppTrackingTransperancy framework, among other functionality. We encourage you to get ready for iOS 14 by testing and ensuring that your app is running smoothly ahead of the expected changes.

## Compatability
- **iOS version >= 10**

- **AppsFlyer SDK version 6.0.0 (currently beta)**

## How do I test IDFA collection?

When the application initialises in iOS 14:

<img src="https://user-images.githubusercontent.com/61788924/89154579-cd429380-d56f-11ea-96be-0a39e2bf1350.png" alt="idfa_menu" width="320" />

This code shows a menu that requests the user to authorise IDFA collection.

```swift
// The following block is for applications wishing to collect IDFA.
// for iOS 14 and above - The user will be prompted for permission to collect IDFA.
//                        If permission granted, the IDFA will be collected by the SDK.
// for iOS 13 and below - The IDFA will be collected by the SDK. The user will NOT be prompted for permission.
if #available(iOS 14, *) {
    // Set a timeout for the SDK to wait for the IDFA collection before handling app launch
    AppsFlyerLib.shared().waitForAdvertisingIdentifier(withTimeoutInterval: 60)
    // Show the user the Apple IDFA consent dialog (AppTrackingTransparency)
    // Can be called in any place
    ATTrackingManager.requestTrackingAuthorization { (status) in
    }
}
```
[Get code here](https://github.com/AppsFlyerSDK/appsflyer-sdk-v6-sample-app/blob/b76d334a7dd757bcf19485c87a184df2b2d7a370/swift/sdk-v6-demo/sdk-v6-demo/AppDelegate.swift#L41-L47)

In the app you have a button '**Test IDFA collection**'

#### If user authorised IDFA collection, its IDFA will be displayed
<img src="https://user-images.githubusercontent.com/61788924/89153007-bfd7da00-d56c-11ea-8b04-1763bd184a5f.png" alt="idfa_ok" width="350" />

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
