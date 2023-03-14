import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:wallet_merchant/component/loading_widget.dart';
import 'package:wallet_merchant/constants.dart';

import '../../size_config.dart';
import 'component/otp_field.dart';
import 'controller/otp_controller.dart';

class OtpScreen extends GetView<OtpController> {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );

    var phone=Get.arguments[0];

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            width: SizeConfig.screenWidth,
            color: kColorPrimary,
            child: Form(
                key: controller.otpFormKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Enter the 6 digit security  code \n that was  sent to your mobile number",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(100),
                    ),
                    const BuildOtpFormField(),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    const Text(
                      "The security code is valid for",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Obx(() => CountdownTimer(
                        controller: controller.controller,
                        endTime: controller.endTime.value,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Obx(() => controller.isLoading.value == 0
                          ? GestureDetector(
                              onTap: () {
                                controller.checkLogin();
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.black),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Verify",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : LoadingWidget.buildLoadingWidget(),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                   GestureDetector(
                          onTap: () {
                            controller.restartTime(phone);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.yellow),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Resend",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )
                  ],
                ))));
  }
}
