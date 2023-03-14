import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_merchant/model/hive/dowasco_account_model.dart';
import 'package:wallet_merchant/screen/splash/splash_screen.dart';
import 'package:wallet_merchant/theme.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';
import 'package:flutter/services.dart';
import 'binding/global_binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GlobalBinding().dependencies();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(DowascoAccountModelAdapter());
  runApp(OverlaySupport(
      child: GetMaterialApp(
        title: "MLajan",
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const MySplashScreen(),
  )));
}
