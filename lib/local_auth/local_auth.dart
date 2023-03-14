

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';


class LocalAuth{
  static final _auth = LocalAuthentication();

  static Future<bool> biometrics()async {
    return _auth.canCheckBiometrics;
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authentication ()async{

    final isAvailable = await biometrics();

    if(!isAvailable) return false;

    try{
      return await _auth.authenticate(localizedReason: 'Scan Fingureprint to authenticate',
          options: const AuthenticationOptions(
              useErrorDialogs: true,
              stickyAuth: true,
              // biometricOnly: true,
              sensitiveTransaction: true
          ));
    }on PlatformException catch (e){
      return false;
    }
  }
}