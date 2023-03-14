import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:wallet_merchant/shared_prefs_helper.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  SharedPrefsHelper.appVersion(packageInfo.version);
  return packageInfo.version;
}

Future<String> getDeviceId() async {
  String token = await SharedPrefsHelper.getFcmToken();
  return token;
}

Future<String> getFlag() async {
  return "agentmerchant";
}

Future<String?> getFullName() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.androidId; // unique ID on Android
  }
}

Future<String?> getOsVersion() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.systemVersion; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.version.release; // unique ID on Android
  }
}

Future<String?> getPhoneBrand() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) { // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.model; // unique ID on iOS
  } else {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.model; // unique ID on Android
  }
}

Future<String?> getOs() async {

  if (Platform.isIOS) { // import 'dart:io'
    return "ios"; // unique ID on iOS
  } else {
    return "android"; // unique ID on Android
  }
}




