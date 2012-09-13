#!/bin/bash

# Options
cert_file="YOUR_CERT_FILE.p12"
password="YOUR_CERT_PASSWORD"
adt_directory="/Applications/Adobe Flash Builder 4.6/sdks/4.6.0/bin"
mopub_sdk_directory="lib/mopub-client"
library_directory="Mopub-Library"
native_android_directory="Mopub-Native-Android"
native_ios_directory="Mopub-Native-IOS"


# Pre Settings
signing_options="-storetype pkcs12 -keystore "${cert_file}
dest_ANE="bin/Mopub.ane"
extension_XML=${library_directory}/src/extension.xml 
library_SWC=${library_directory}/bin/Mopub-Library.swc 

# Unzip library.swf
unzip -o ${library_directory}/bin/Mopub-Library.swc library.swf

# Copy swc libarary
cp ${library_directory}/bin/Mopub-Library.swc bin/Mopub.swc

# Complie Android Library
cd ${native_android_directory}
ant
cd ..

# Package extensions
"${adt_directory}"/adt -package -storetype pkcs12 -keystore ./cert.p12 -storepass ${password} -keypass ${password} -target ane "${dest_ANE}" "${extension_XML}" -swc "${library_SWC}"  -platform iPhone-ARM library.swf -C ${native_ios_directory}/build/Release-iphoneos/ . -C ${native_ios_directory}/Mopub/ MPAdBrowserController.nib -platformoptions ${library_directory}/src/ios-platformoptions.xml -platform Android-ARM library.swf -C ${native_android_directory}/build/jar/ Mopub.jar -C ${mopub_sdk_directory}/Android/mopub-android-sdk res/.

# Clean up
rm library.swf
