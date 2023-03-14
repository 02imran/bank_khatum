import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wallet_merchant/component/AvatarLetter.dart';
import 'package:wallet_merchant/component/bottomnevigation/CustomBottomNavigationBarItem.dart';
import 'package:wallet_merchant/component/bottomnevigation/custom_bottom_navigation_bar.dart';
import 'package:wallet_merchant/constants.dart';
import 'package:wallet_merchant/screen/about_us/about_us_screen.dart';
import 'package:wallet_merchant/screen/dashboard/component/agent-report/report.dart';
import 'package:wallet_merchant/screen/dashboard/component/purchase/qr_view.dart';
import 'package:wallet_merchant/screen/location/place_picker_screen.dart';
import 'package:wallet_merchant/screen/my-message/my_message_screen.dart';
import 'package:wallet_merchant/screen/my-qr-code/my_qr_code_screen.dart';
import 'package:wallet_merchant/screen/reset-security-question/reset-security_question_screen.dart';
import 'package:wallet_merchant/screen/security-question/security_question_screen.dart';
import 'package:wallet_merchant/screen/update-pin/update-pin.dart';
import '../../size_config.dart';
import 'component/agent/agent.dart';
import 'component/balance/balance.dart';
import 'component/get-payment/get_payment.dart';
import 'component/home/merchant_home.dart';
import 'component/purchase/purchase.dart';
import 'component/report/report.dart';
import 'component/service/service.dart';
import 'controller/dashboard_controller.dart';


class Dashboard extends GetView<DashboardController> {

  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.lazyPut<DashboardController>(
          () => DashboardController(),
    );

    return  AdvancedDrawer(
        controller: controller.advancedDrawerController,
        animationCurve: Curves.easeInOut,
        backdropColor: kColorPrimaryLight,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      drawer: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListTileTheme(
            textColor: kTextColor,
            iconColor: Colors.blue,
            child: ListView(
              children: [
                Container(
                  color: kColorPrimary,
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 38.0,
                        bottom: 20.0,

                      ),
                      child: Column(
                        children: [
                          // Obx(()=>
                          //   Container(
                          //     decoration: BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         border: Border.all(color: Colors.white, width: 2)
                          //
                          //     ),
                          //     child: AvatarLetter(
                          //       size: getProportionateScreenWidth(90),
                          //       backgroundColor: kColorPrimary,
                          //       textColor: Colors.white,
                          //       fontSize: 35,
                          //       upperCase: true,
                          //       numberLetters: 2,
                          //       letterType: LetterType.Circular,
                          //      text: controller.fullNameFromResponse.value.isEmpty?"A":controller.fullNameFromResponse.value.replaceAll("-", " "),
                          //     ),
                          //   ),
                          //  ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 2, color: Colors.white)
                            ),
                            child: const CircleAvatar(
                              maxRadius: 35,
                              backgroundImage: AssetImage('assets/icons/user_icon_default.jpg'),
                            ),
                          ),

                          const SizedBox(height: 10,),
                           Obx(()=>
                           Text(controller.fullNameFromResponse.value,style: const TextStyle(color: Colors.white),),
                           ),
                          const SizedBox(height: 1,),
                          Obx(()=>
                            Text(controller.walletId.value,style: const TextStyle(color: Colors.white),),
                          ),
                          const SizedBox(height: 1,),
                           Obx(()=>
                           Text(controller.accountCode.value,style: const TextStyle(color: Colors.white),),
                           )
                          ],
                      ),
                    ),

                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10),),
                Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(15)),
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    onTap: () {

                      Get.to(const MyMessageScreen());
                    },
                    leading: Image.asset('assets/icons/My_mesages.png', height: 18, width: 18,color: kColorPrimary),
                    title: const Text('My Message',style: TextStyle(color: Colors.black),),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(15)),
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    onTap: ()  {

                    showPlacePicker(context);

                    },
                    leading: Image.asset('assets/icons/My_Location.png', height: 18, width: 18,color: kColorPrimary),
                    title: const Text('My Location',style: TextStyle(color: Colors.black),),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(15)),
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    onTap: () {

                      Get.to(MyQrCodeScreen(userType: controller.userType.value,code:controller.accountCode.value,fullName: controller.fullNameFromResponse.value,));
                    },
                    leading: Image.asset('assets/icons/QR_Code.png', height: 18, width: 18,color: kColorPrimary),
                    title: const Text('My Qr Code',style: TextStyle(color: Colors.black),),
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Container(
                  color: kColorPrimary,
                  height: 0.3,
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(15)),
                  child: ListTile(
                    visualDensity: const  VisualDensity(vertical: -4),
                    onTap: () {
                      Get.to(const UpdatePin(isOpenFromMenu: true,));

                    },
                    leading: Image.asset('assets/icons/Change_PIN.png', height: 18, width: 18,color: kColorPrimary),
                    title: const Text('Change Pin',style: TextStyle(color: Colors.black),),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(15)),
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    onTap: () {
                      Get.to(const ResetSecurityQuestionScreen());
                    },
                    leading: Image.asset('assets/icons/Reset_PIN.png', height: 18, width: 18,color: kColorPrimary),
                    title: const Text('Reset Pin',style: TextStyle(color: Colors.black),),
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(15)),
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    onTap: () {
                      Get.to(const SecurityQuestionScreen());
                    },
                    leading: Image.asset('assets/icons/Security_Question.png', height: 18, width: 18,color: kColorPrimary),
                    title: const Text('Set Security Question',style: TextStyle(color: Colors.black),),
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Container(
                  color: kColorPrimary,
                  height: 0.3,
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(15)),
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    onTap: () {
                      Get.to(()=> QRViewExample());
                    },
                    leading: Image.asset('assets/images/voucher.png', height: 18, width: 18,color: kColorPrimary,),
                    title: const Text('Use Voucher',style: TextStyle(color: Colors.black),),
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(10)),
                Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(15)),
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: -4),
                    onTap: () {
                      Get.to(()=> AboutUsScreen());
                    },
                    leading: Image.asset('assets/icons/About_Us.png', height: 18, width: 18,color: kColorPrimary,),
                    title: const Text('About Us',style: TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),

        ),
      ),
      child:Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title:  Text("Khartoum Agent",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
        leading: IconButton(
          onPressed: controller.handleMenuButtonPressed,
          icon: ValueListenableBuilder<AdvancedDrawerValue>(
            valueListenable: controller.advancedDrawerController,
            builder: (_, value, __) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Image.asset(
                  'assets/icons/menu.png',
                  height: getProportionateScreenHeight(28),
                  width: getProportionateScreenHeight(28),
                  key: ValueKey<bool>(value.visible),
                  color: Colors.red,
                ),
              );
            },
          ),
        ),
      ),

      body:  Obx(() => controller.userType.value=="Merchant"?PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageControllerMerchant,
        children: const [MerchantHome()],
      ):controller.userType.value=="Agent"?

      PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageControllerAgent,
        children: const [Service()],
      ):Container(),
      ),
      // bottomNavigationBar:  Obx(() => controller.userType.value=="Merchant"?CustomBottomNavigationBar(
      //   backgroundColor: kColorPrimary,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white,
      //   itemBackgroudnColor: kColorPrimary,
      //   items: [
      //     CustomBottomNavigationBarItem(
      //         icon: Icons.person,
      //         title: "Profile",
      //         titleTextColor: kTextColor),
      //     CustomBottomNavigationBarItem(
      //         icon: Icons.payment,
      //         title: "Payment",
      //         titleTextColor: kTextColor),
      //
      //     CustomBottomNavigationBarItem(
      //         icon: Icons.payments_outlined,
      //         title: "Purchase",
      //         titleTextColor: kTextColor),
      //
      //     CustomBottomNavigationBarItem(
      //         icon: Icons.report,
      //         title: "Report",
      //         titleTextColor: kTextColor),
      //
      //     CustomBottomNavigationBarItem(
      //         icon: Icons.account_balance,
      //         title: "Balance",
      //         titleTextColor: kTextColor)
      //   ],
      //   onTap: (index){
      //     if(index==0&&controller.selectedIndexMerchant.value!=0){
      //       controller.pageControllerMerchant.animateToPage(0,
      //           curve: Curves.fastLinearToSlowEaseIn,
      //           duration: const Duration(milliseconds: 600));
      //        controller.selectedIndexMerchant.value=0;
      //     }
      //     else if(index==1&&controller.selectedIndexMerchant.value!=1){
      //       controller.pageControllerMerchant.animateToPage(1,
      //           curve: Curves.fastLinearToSlowEaseIn,
      //           duration: const Duration(milliseconds: 600));
      //       controller.selectedIndexMerchant.value=1;
      //     }
      //     else if(index==2&&controller.selectedIndexMerchant.value!=2){
      //       controller.pageControllerMerchant.animateToPage(2,
      //           curve: Curves.fastLinearToSlowEaseIn,
      //           duration: const Duration(milliseconds: 600));
      //       controller.selectedIndexMerchant.value=2;
      //     }
      //     else if(index==3&&controller.selectedIndexMerchant.value!=3){
      //       controller.pageControllerMerchant.animateToPage(3,
      //           curve: Curves.fastLinearToSlowEaseIn,
      //           duration: const Duration(milliseconds: 600));
      //       controller.selectedIndexMerchant.value=3;
      //     }
      //     else if(index==4){
      //       controller.pageControllerMerchant.animateToPage(4,
      //           curve: Curves.fastLinearToSlowEaseIn,
      //           duration: const Duration(milliseconds: 600));
      //       controller.selectedIndexMerchant.value=4;
      //     }
      //   },
      // )
      //     :controller.userType.value=="Agent"?
      //
      // CustomBottomNavigationBar(
      //   backgroundColor: kColorPrimary,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.white,
      //   itemBackgroudnColor: kColorPrimary,
      //   items: [
      //     CustomBottomNavigationBarItem(
      //         icon: Icons.home_repair_service,
      //         title: "Service",
      //         titleTextColor: kTextColor),
      //     CustomBottomNavigationBarItem(
      //         icon: Icons.report,
      //         title: "Report",
      //         titleTextColor: kTextColor),
      //
      //     CustomBottomNavigationBarItem(
      //         icon: Icons.support_agent,
      //         title: "Agent",
      //         titleTextColor: kTextColor)
      //   ],
      //   onTap: (index){
      //     if(index==0&&controller.selectedIndexAgent.value!=0){
      //       controller.pageControllerAgent.animateToPage(0,
      //           curve: Curves.fastLinearToSlowEaseIn,
      //           duration: const Duration(milliseconds: 600));
      //       controller.selectedIndexAgent.value=0;
      //     }
      //     else if(index==1&&controller.selectedIndexAgent.value!=1){
      //       controller.pageControllerAgent.animateToPage(1,
      //           curve: Curves.fastLinearToSlowEaseIn,
      //           duration: const Duration(milliseconds: 600));
      //       controller.selectedIndexAgent.value=1;
      //     }
      //     else if(index==2&&controller.selectedIndexAgent.value!=2){
      //       controller.pageControllerAgent.animateToPage(2,
      //           curve: Curves.fastLinearToSlowEaseIn,
      //           duration: const Duration(milliseconds: 600));
      //       controller.selectedIndexAgent.value=2;
      //     }
      //   },
      // )
      //
      //     :Container(),
      // )

    )
    );

  }

  void showPlacePicker(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
         return controller.latitude.value !=0.0?PlacePickerScreen("AIzaSyA5CwqWWemijUqL6sg6wvwve6sAigEGVY8",
            displayLocation: LatLng(
                controller.latitude.value, controller.longitude.value),):PlacePickerScreen("AIzaSyA5CwqWWemijUqL6sg6wvwve6sAigEGVY8",);
        }));

  }


}