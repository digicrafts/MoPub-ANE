MoPub Native Extension for Adobe Air
=========

This Mopub ANE add supprt to using MoPub Mobile monetization platform with Adobe Air. Supports Android and iOS.

##What is MoPub?

Powerful Ad Management for Mobile Apps. Drive more revenue from your mobile apps with the world’s leading ad server and exchange for smartphones.

http://www.mopub.com

##Install the library

Add the MoPub-ANE library to your project.

In Flash Professional CS6:

  1. Create a new mobile project
  2. Choose File > PublishSettings... 
  3. Select the wrench icon next to 'Script' for 'ActionScriptSettings' 
  4. Select the Library Path tab. 
  5. Click 'Browse for Native Extension(ANE) File' and select the Mopub.ane file. 

In Flash Builder 4.6:

  1. Goto Project Properties
  2. Select Native Extensions under Actionscript Build Path
  3. Choose Add ANE... and navigate to the Mopub.ane file 
  4. Select Actionscript Build Packaging > Google Android or Apple IOS
  5. Select the Native Extensions tab, and click the 'Package' check box next to the extension

In Flash Professional CS5.5 or Lower:

  1. Select File>PublishSettings>Flash>ActionScript 3.0 Settings 
  2. Select External Library Path
  3. Click Browseto SWC File
  4. Select the Mopub.swc

In Flash Builder 4.5:

  1. Goto Project Properties
  2. Select Action Script Build Path
  3. Select Add Swc
  4. Navigate to Mopub.swc and choose External Library type

In FlashDevelop:

  1. Copy the Mopub.swc file to your project folder.
  2. In the explorer panel, right click the .swc and select Add to Library.
  3. Right-click the swc file in the explorer, choose Options, and select External Library

##Add the Actionscript

Import the library

```javascript
  import digicrafts.extensions.Mopub;
```

Create the MoPub AdView

```javascript
  Mopub.create("MOPUB_AD_UNIT_ID");
```

Show the AdView

```javascript
  Mopub.showAdView(0,420,320,50);// x, y, width, height
```

Hide the AdView

```javascript
  Mopub.dismissAdView();
```

##Setup for Android

Update Your Application Descriptor

You'll need to be using the AIR 3.1 SDK or higher, include the extension in your Application Descriptor XML, and update the Android Manifest Additions with some settings.

Add the following settings in <application> tag.

```xml
<activity android:name="com.mopub.mobileads.MoPubActivity" android:configChanges="keyboardHidden|orientation"/>
<activity android:name="com.mopub.mobileads.MraidActivity" android:configChanges="keyboardHidden|orientation"/>
<activity android:name="com.mopub.mobileads.MraidBrowser" android:configChanges="keyboardHidden|orientation"/>
```

Add the following settins if you want to use AdMob (Use Google Play Service).

```xml
<meta-data android:name="com.google.android.gms.version" android:value="@integer/google_play_services_version" />
<activity android:name="com.google.android.gms.ads.AdActivity" android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize"/>
```

```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```
