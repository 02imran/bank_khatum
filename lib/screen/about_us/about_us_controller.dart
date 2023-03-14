

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutUsController extends GetxController{
  SharedPreferences? pref;
  var appVersion = ''.obs;

  @override
  void onInit() async{
    print('shared pref');
     pref = await SharedPreferences.getInstance();
    appVersion.value = '${pref!.getString('appVersion')}';
    print(appVersion);
    super.onInit();

  }
}