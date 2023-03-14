

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallet_merchant/screen/about_us/about_us_controller.dart';
import 'package:wallet_merchant/screen/about_us/terms_and_conditions.dart';
import 'package:wallet_merchant/shared_prefs_helper.dart';
import 'package:wallet_merchant/size_config.dart';


import '../../constants.dart';
import 'package:get/get.dart';

class AboutUsScreen extends GetView<AboutUsController> {
   AboutUsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Get.lazyPut<AboutUsController>(
          () => AboutUsController(), fenix: true,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorPrimaryNew,
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        title: const Text("ABOUT"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        // child: ListView(
        //
        //   children: [
        //     SizedBox(height: getProportionateScreenHeight(20)),
        //     const Text('Corporate History', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),),
        //     SizedBox(height: getProportionateScreenHeight(10)),
        //     const Text('''MLajan Financial Technology Services Ltd was incorporated as a private limited liability company in the Commonwealth of Dominica on 20 March 2020 under Registration No. 2020/CO0047 issued by Registrar of Companies under the Companies Act No. 21 of 1994. The company is wholly owned by the Dominica Cooperative Societies League Ltd. (DCSLL), a Cooperative registered in the Commonwealth of Dominica and regulated by the Cooperative Societies Act 2 of 2011 and the APEX body for credit unions in Dominica. DCSLL has been serving the credit union movement and its stakeholders in Dominica since 1957. The Credit Union movement in Dominica represents one of the worlds highest credit union market penetration per jurisdiction and as a movement, MLajan aims to build accessible and affordable digital financial services to the peoples of Dominica and by extension the OECS region. MLajan is one application, many conveniences. If you have any questions, please send us a thorough description to MLajan Helpdesk. We strive to respond to all User requests.''', style: TextStyle(fontSize: 12, color: Colors.grey), ),
        //     //
        //     SizedBox(height: getProportionateScreenHeight(20)),
        //
        //     const Text('App Version', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
        //     Obx(() => Text('${controller.appVersion.value}', style: const TextStyle(fontSize: 12, color: Colors.grey),)),
        //     SizedBox(height: getProportionateScreenHeight(20)),
        //     GestureDetector(
        //         onTap: (){
        //           Get.to(()=>TermsAndConditions());
        //         },
        //         child: const Text('Terms and Conditions', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF308593)))),
        //     // SizedBox(height: getProportionateScreenHeight(20)),
        //     // GestureDetector(
        //     //     onTap: _launchUrlPrivacyAndPolicy,
        //     //     child: const Text('Privacy Policy', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF308593)))),
        //     // SizedBox(height: getProportionateScreenHeight(20)),
        //
        //
        //   ],
        // ),
      ),

    );
  }

}
