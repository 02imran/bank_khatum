import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPrefsHelper{

  static void storeFcmToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('fcm', token);
  }
  static void appVersion(String version) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('appVersion', version);
  }

  static Future<String> getFcmToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('fcm') ?? "";
  }

  static void storeMsisdn(String msisdn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('msisdn', msisdn);
  }

  static Future<String> getMsisdn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('msisdn') ?? "";
  }

  static void storeBasicToken(String password,String msisdn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if(password.isNotEmpty){
      String tokenStr = msisdn+":"+password;
      Codec<String, String> stringToBase64 = utf8.fuse(base64);
      String encoded = stringToBase64.encode(tokenStr);
      pref.setString('token', "Basic "+encoded);
    }else{
      pref.setString('token', "");
    }

  }

  static Future<String> getBasicToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? "";
  }

  static void storeWalletType(int walletType) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('walletType', walletType.toString());
  }

  static Future<String> getWalletType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('walletType') ?? "";
  }


  static void storeServiceToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('serviceToken', token);
  }

  static Future<String> getServiceToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('serviceToken') ?? "";
  }


}