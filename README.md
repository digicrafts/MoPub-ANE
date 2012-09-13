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
  4. Select Actionscript Build Packaging > Google Android
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
  Mopub.showAdView(0,420,320,50);
```

Hide the AdView

```javascript
  Mopub.dismissAdView();
```

###Setup for Android